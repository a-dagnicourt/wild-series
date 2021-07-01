<?php

namespace App\Form;

use App\Entity\Actor;
use App\Entity\Program;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Vich\UploaderBundle\Form\Type\VichFileType;

class ActorType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('name', TextType::class, [
                'attr' => ["autofocus" => true],
                'label' => 'Nom :'
                ])
            ->add('pictureFile', VichFileType::class, [
                    'label' => 'Photo :',
                    'required' => true,
                    'allow_delete' => false,
                    'download_uri' => false,
                ])
            ->add('programs', EntityType::class, [
                'class' => Program::class,
                'choice_label' => 'title',
                'label' => 'Séries',
                'multiple' => true,
                'expanded' => true,
                'by_reference' => false,
            ]);
                
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Actor::class,
        ]);
    }
}
