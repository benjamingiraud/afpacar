<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class RegisterController extends Controller
{
    /**
     * @Route("/register", name="register")
     */
    public function registerAction()
    {
        $establishments = $this->getDoctrine()
        ->getRepository('AppBundle:Establishment')
        ->findAll();
        return $this->render('register.html.twig',
                             array('establishments' => $establishments));
    }
   
}