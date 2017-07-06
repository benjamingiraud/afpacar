<?php
namespace AppBundle\Form;

use AppBundle\Entity\User;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;

class UserType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
//         $establishments = $this->getDoctrine()
//            ->getRepository('AppBundle:Establishment')
//            ->findAll();
//        $estabArray = [];
//        foreach ($establishments as $establishment) {
//            var_dump($establishment->getName());
//            $estabArray[$establishment->getName()] = $establishment->getId();
//        }
        $builder
            ->add('mail', EmailType::class, array (
                'label' => 'Adresse email :'
            ))
            ->add('username', TextType::class, array (
                'label' => 'Nom d\'utilisateur : '
            ))
            ->add('plainPassword', RepeatedType::class, array(
                'type' => PasswordType::class,
                'first_options'  => array('label' => 'Mot de passe :'),
                'second_options' => array('label' => 'Répéter votre mot de passe :'),
            ));
//            ->add('establishment', ChoiceType::class, array(
//                'choices'  => $estabArray
//            ));
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => User::class,
        ));
    }
}