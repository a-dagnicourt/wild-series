<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Symfony\Component\Validator\Constraints as Assert;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=CategoryRepository::class)
 */

class Category
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */ 
    private $id;

    /**
     * @ORM\Column(type="string", length=100)
     * @Assert\NotBlank(message="Le champs ne peut pas être vide.")
     * @Assert\Length(max="100", maxMessage="La saisie {{ value }} est trop longue, le maximum est {{ limit }} caractères.")
     */
    private $name;

    /**
    * @ORM\OneToMany(targetEntity=Program::class, mappedBy="category")
    */    
    private $programs;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $slug;

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

    public function getSlug(): ?string
    {
        return $this->slug;
    }

    public function setSlug(string $slug): self
    {
        $this->slug = $slug;

        return $this;
    }
}
