<?php

namespace App\Form;

use App\Entity\Episode;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class EpisodeType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('title', TextType::class, [
                'attr' => ["autofocus" => true],
                'label' => 'Titre :'
                ])
            ->add('number', IntegerType::class, [
                'label' => 'Numéro :'
                ])
            ->add('summary', TextareaType::class, [
                'label' => 'Résumé :'
                ])
            ->add('season', null, ['choice_label' => 'number','label' => 'Saison :'])
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Episode::class,
        ]);
    }
}
