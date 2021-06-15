<?php

namespace App\Entity;

use App\Repository\ActorRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping\Column;
use Doctrine\ORM\Mapping\GeneratedValue;
use Doctrine\ORM\Mapping\Id;
use Doctrine\ORM\Mapping\Entity;
use Doctrine\ORM\Mapping\ManyToMany;
use Symfony\Component\Validator\Constraints as Assert;

#[Entity(repositoryClass:ActorRepository::class)]

class Actor
{
    #[Id]
    #[GeneratedValue()]
    #[Column(type:"integer")]  
    private $id;

    #[Column(type:"string", length:255)]
    #[Assert\NotBlank(message:"Le champs ne peut pas être vide.")]
    #[Assert\Length(max:"255", maxMessage:"La saisie {{ value }} est trop longue, le maximum est {{ limit }} caractères.")]
    private $name;

    #[ManyToMany(targetEntity:Program::class, inversedBy:"actors")]
    private $programs;

    public function __construct()
    {
        $this->programs = new ArrayCollection();
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

    /**
     * @return Collection|Program[]
     */
    public function getPrograms(): Collection
    {
        return $this->programs;
    }

    public function addProgram(Program $program): self
    {
        if (!$this->programs->contains($program)) {
            $this->programs[] = $program;
        }

        return $this;
    }

    public function removeProgram(Program $program): self
    {
        $this->programs->removeElement($program);

        return $this;
    }
}
