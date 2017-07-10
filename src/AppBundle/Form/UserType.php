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
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\Extension\Core\Type\DateType;

class UserType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('mail', EmailType::class, array (
                'label' => 'Adresse email : '
            ))
            ->add('username', TextType::class, array (
                'label' => 'Nom d\'utilisateur : '
            ))
            ->add('plainPassword', RepeatedType::class, array(
                'type'           => PasswordType::class,
                'first_options'  => array('label' => 'Mot de passe :'),
                'second_options' => array('label' => 'Répéter votre mot de passe :'),
                'invalid_message'=> 'Les mots de passe ne correspondent pas',
            ))
            ->add('region', EntityType::class, array(
                'class'        => 'AppBundle:Region',
                'label'        => 'Votre région : ',
                'choice_label' => 'region'
            ))
            ->add('expire', DateType::class, array(
                'label'  => 'Date de fin de formation : ',
                'widget' => 'single_text',
                'attr'   => ['class' => 'js-datepicker']
            ));
    }
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => User::class,
        ));
    }
}