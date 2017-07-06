<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class AdvertController extends Controller
{
    /**
     * @Route("/adverts/{region}", name="advert")
     */
    public function loginAction(Request $request)
    {
       $id = $request->query->get('id');
       $em = $this->getDoctrine()->getManager();
        
       $query = $em->createQuery('SELECT c, e
                                  FROM AppBundle:Carpooling c
                                  JOIN c.establishment e
                                  WHERE e = :id
                                ')->setParameter('id', $id);
       
      $adverts = $query->getResult();
      $number = count($adverts);
        return $this->render('adverts.html.twig', 
                array('adverts' => $adverts,
                      'number' => $number));
    }
}