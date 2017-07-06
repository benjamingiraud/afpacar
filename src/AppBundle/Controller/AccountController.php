<?php

namespace AppBundle\Controller;

use AppBundle\Form\UserType;
use AppBundle\Entity\User;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;   
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;

class AccountController extends Controller
{
    /**
     * @Route("/register", name="register")
     */

    public function registerAction(Request $request, 
            UserPasswordEncoderInterface $passwordEncoder)
    {
        
        // 1) build the form
        $user = new User();
        $form = $this->createForm(UserType::class, $user);

        // 2) handle the submit (will only happen on POST)
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {

            // 3) Encode the password (you could also do this via Doctrine listener)
            $password = $passwordEncoder
                    ->encodePassword($user, $user->getPlainPassword());
            $user->setPassword($password);

            // 4) save the User!
            $em = $this->getDoctrine()->getManager();
            $em->persist($user);
            $em->flush();

            // ... do any other work - like sending them an email, etc
            // maybe set a "flash" success message for the user

            return $this->redirectToRoute('login');
        }
        
        return $this->render(
            'register.html.twig',
            array('form' => $form->createView())
        );
    }
    
    /**
     * @Route("/login", name="login")
     */
    
    public function loginAction(Request $request, AuthenticationUtils $authUtils)
    {
        $error = $authUtils->getLastAuthenticationError();

        // last username entered by the user
        $lastUsername = $authUtils->getLastUsername();

        return $this->render('login.html.twig', array(
            'last_username' => $lastUsername,
            'error'         => $error,
        ));
    }
    
    /**
     * @Route("/logout", name="logout")
     */
    
    public function logoutAction()
    {
        return $this->render('index.html.twig');
    }
}