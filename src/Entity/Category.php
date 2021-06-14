<?php

namespace App\Entity;

use App\Repository\CategoryRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping\Column;
use Doctrine\ORM\Mapping\Entity;
use Doctrine\ORM\Mapping\GeneratedValue;
use Doctrine\ORM\Mapping\Id;
use Doctrine\ORM\Mapping\OneToMany;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Validator\Constraints as Assert;


#[Entity(repositoryClass:CategoryRepository::class)]
#[UniqueEntity('name',message: "La catégorie existe déjà.")]

class Category
{
    
    #[Id]
    #[GeneratedValue()]
    #[Column(type:"integer")]    
    private $id;

    #[Column(type:"string", length:100)]
    #[Assert\NotBlank(message:"Le champs ne peut pas être vide.")]
    #[Assert\Length(max:"100", maxMessage:"La saisie {{ value }} est trop longue, le maximum est {{ limit }} caractères.")]
    private $name;

    
    #[OneToMany(targetEntity:Program::class, mappedBy:"category")]
    
    private $programs;

    public function __construct()
    {
        $this->programs = new ArrayCollection();
    }

    
    /**
    * @return Collection|Program[]
    */    
    public function getPrograms(): Collection
    {
        return $this->programs;
    }

    /**
    * @param Program $program
    * @return Category
    */
    public function addProgram(Program $program): self
    {
        if (!$this->programs->contains($program)) {
            $this->programs[] = $program;
            $program->setCategory($this);
        }

        return $this;
    }

    /**
    * @param Program $program
    * @return Category
    */
    public function removeProgram(Program $program): self
    {
        if ($this->programs->contains($program)) {
                $this->programs->removeElement($program);
                  // set the owning side to null (unless already changed)
                if ($program->getCategory() === $this) {
                    $program->setCategory(null);
                }
        }

        return $this;
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }
}
