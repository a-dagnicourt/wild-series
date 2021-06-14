<?php

namespace App\Entity;

use App\Repository\SeasonRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping\Column;
use Doctrine\ORM\Mapping\Entity;
use Doctrine\ORM\Mapping\GeneratedValue;
use Doctrine\ORM\Mapping\Id;
use Doctrine\ORM\Mapping\JoinColumn;
use Doctrine\ORM\Mapping\ManyToOne;
use Doctrine\ORM\Mapping\OneToMany;
use Symfony\Component\Validator\Constraints as Assert;

#[Entity(repositoryClass:SeasonRepository::class)]

class Season
{
    #[Id]
    #[GeneratedValue()]
    #[Column(type:"integer")] 
    private $id;

    #[ManyToOne(targetEntity:Program::class, inversedBy:"seasons")]
    #[JoinColumn(nullable:false)]
    private $program;

    
    #[Column(type:"integer")]    
    #[Assert\GreaterThan(0, message: "Le numéro doit être supérieur à 0")]
    #[Assert\LessThan(100, message: "Le numéro doit être inférieur à 100")]   
    private $number;

    
    #[Column(type:"integer")] 
    #[Assert\GreaterThan(1900, message: "La date doit être supérieure à 1900")]
    #[Assert\LessThan(2050, message: "La date doit être inférieure à 2050")]  
    private $year;

    #[Column(type:"text")]      
    #[Assert\NotBlank(message:"Le champs ne peut pas être vide.")]
    private $description;

    #[OneToMany(targetEntity:Episode::class, mappedBy:"season", orphanRemoval:true)]
    private $episodes;

    public function __construct()
    {
        $this->episodes = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getProgram(): ?Program
    {
        return $this->program;
    }

    public function setProgram(?Program $program): self
    {
        $this->program = $program;

        return $this;
    }

    public function getNumber(): ?int
    {
        return $this->number;
    }

    public function setNumber(int $number): self
    {
        $this->number = $number;

        return $this;
    }

    public function getYear(): ?int
    {
        return $this->year;
    }

    public function setYear(int $year): self
    {
        $this->year = $year;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(?string $description): self
    {
        $this->description = $description;

        return $this;
    }

    /**
     * @return Collection|Episode[]
     */
    public function getEpisodes(): Collection
    {
        return $this->episodes;
    }

    public function addEpisode(Episode $episode): self
    {
        if (!$this->episodes->contains($episode)) {
            $this->episodes[] = $episode;
            $episode->setSeason($this);
        }

        return $this;
    }

    public function removeEpisode(Episode $episode): self
    {
        if ($this->episodes->removeElement($episode)) {
            // set the owning side to null (unless already changed)
            if ($episode->getSeason() === $this) {
                $episode->setSeason(null);
            }
        }

        return $this;
    }
}
