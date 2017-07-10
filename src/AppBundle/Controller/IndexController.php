<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class IndexController extends Controller
{
    /**
     * @Route("/", name="index")
     */
    
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $query = $em->createQuery('SELECT c 
                                   FROM AppBundle:Carpooling c 
                                   ORDER BY c.id DESC
                                  ');
        $adverts = $query->setMaxResults(5)->getResult();
        return $this->render('index.html.twig', array ('adverts' => $adverts));
    }
}
