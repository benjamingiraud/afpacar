<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class ProfileController extends Controller
{
    /**
     * @Route("/profile/{username}", name="profile")
     */
    
    public function indexAction($username)
    {
        $user = $this->getDoctrine()
        ->getRepository('AppBundle:User')
        ->findOneBy(array('username' => $username));
        return $this->render('profile.html.twig',
                array('user' => $user,
                      'username' => $username));
        
    }
}
