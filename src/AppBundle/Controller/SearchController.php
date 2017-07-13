<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class SearchController extends Controller
{
    /**
     * @Route("/search/{filter}", name="search")
     */
    
    public function mapAction($filter)
    {
        $em = $this->getDoctrine()->getManager();

        $query = $em->createQuery('SELECT e, r 
                                   FROM AppBundle:Establishment e
                                   JOIN e.region r
                                   WHERE r.region = :region'
                                 )->setParameter('region', $filter);

        $establishments = $query->getResult();
        $queryNumber    = count($establishments);

        return $this->render('search.html.twig', array(
            'establishments' => $establishments,
            'number'         => $queryNumber,
            'filter'         => $filter
        ));
    }
    
    /**
     * @Route("/search", name="inputsearch")
     */
    
    public function inputAction(Request $request)
    {
        $filter = $request->request->get('search');
        $em = $this->getDoctrine()->getManager();

        $query = $em->createQuery('SELECT e, r
                                   FROM AppBundle:Establishment e
                                   JOIN e.region r
                                   WHERE e.address LIKE :test
                                   OR    r.region  LIKE :test
                                   OR    e.postal  LIKE :test
                                   OR    e.city    LIKE :test
                                   OR    e.name    LIKE :test
                                 ')->setParameter("test", '%' . $filter . '%');

        $establishments = $query->getResult();
        $queryNumber    = count($establishments);
       
        return $this->render('search.html.twig', array(
            'establishments' => $establishments,
            'number'         => $queryNumber,
            'filter'         => $filter
        ));
    }
}