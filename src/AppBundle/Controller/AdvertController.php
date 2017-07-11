<?php

namespace AppBundle\Controller;

use AppBundle\Form\CarpoolingType;
use AppBundle\Entity\Carpooling;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class AdvertController extends Controller
{
    /**
     * @Route("/adverts/{region}", name="advert")
     */
    public function listAction(Request $request, $region)
    {
       $id = $request->request->get('establishment_id');
       
       $em = $this->getDoctrine()->getManager();
       $query = $em->createQuery('SELECT c, e
                                  FROM AppBundle:Carpooling c
                                  JOIN c.establishment e
                                  WHERE e = :id
                                ')->setParameter('id', $id);
       
      $adverts = $query->getResult();
      return $this->render('adverts.html.twig',
              array('adverts'         => $adverts,
                    'region'          => $region,
                    'establishmentID' => $id));
    }
    /**
     * @Route("/adverts/{region}/new", name="new_advert")
     */
    public function newAction(Request $request, $region)
    {
       $advert = new Carpooling();
       $id = $request->request->get('establishment_id');
       $establishment = $this->getDoctrine()
                             ->getRepository('AppBundle:Establishment')
                             ->find($id);
       
       $form = $this->createForm(CarpoolingType::class, $advert);
       $form->handleRequest($request);
       
       if ($form->isSubmitted() && $form->isValid()) {
            
            $advert->setEstablishment($establishment);
            $advert->setUser($this->getUser());

            $em = $this->getDoctrine()->getManager();
            $em->persist($advert);
            $em->flush();
            
            return $this->redirectToRoute('index');
        }
       
      return $this->render('newadvert.html.twig',
              array('form' => $form->createView(),
                    'establishment'  => $establishment));
    }
}