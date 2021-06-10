<?php

namespace App\Form;

use App\Entity\Season;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class SeasonType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('number', IntegerType::class, [
                'attr' => ["autofocus" => true],
                'label' => 'Numéro :'
                ])
            ->add('year', IntegerType::class, [
                'label' => 'Année :'
                ])
            ->add('description', TextareaType::class, [
                'label' => 'Résumé :'
                ])
            ->add('program', null, ['choice_label' => 'title','label' => 'Série :'])
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Season::class,
        ]);
    }
}
