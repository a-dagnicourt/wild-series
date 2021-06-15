<?php

namespace App\Form;

use App\Entity\Actor;
use App\Entity\Category;
use App\Entity\Program;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ProgramType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('title', TextType::class, [
                'attr' => ["autofocus" => true],
                'label' => 'Titre :'
                ])
            ->add('summary', TextareaType::class, [
                'label' => 'Résumé :'
                ])
            ->add('poster', TextType::class, [
                'label' => 'Lien affiche :'
                ])
            ->add('country', TextType::class, [
                'label' => 'Pays :'
                ])
            ->add('year', IntegerType::class, [
                'label' => 'Année :'
                ])
            ->add('category', EntityType::class, [
                'class'=> Category::class,
                'choice_label' => 'name',
                'label' => 'Catégorie :',
            ])
            ->add('actors', EntityType::class, [
                'class' => Actor::class,
                'choice_label' => 'name',
                'label' => 'Acteurs',
                'multiple' => true,
                'expanded' => true,
                'by_reference' => false,
            ]);
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Program::class,
        ]);
    }
}
