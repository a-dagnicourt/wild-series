<?php

namespace App\Entity;

use App\Repository\ProgramRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping\Column;
use Doctrine\ORM\Mapping\Entity;
use Doctrine\ORM\Mapping\GeneratedValue;
use Doctrine\ORM\Mapping\Id;
use Doctrine\ORM\Mapping\JoinColumn;
use Doctrine\ORM\Mapping\ManyToOne;
use Doctrine\ORM\Mapping\OneToMany;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Validator\Constraints\Unique;

#[Entity(repositoryClass:ProgramRepository::class)]
#[UniqueEntity('title',message: "La série existe déjà.")]

class Program
{
    #[Id]
    #[GeneratedValue()]
    #[Column(type:"integer")]  
    private $id;

    #[Column(type:"string", length:255, unique:true)]
    #[Assert\NotBlank(message:"Le champs ne peut pas être vide.")]
    #[Assert\Length(max:"255", maxMessage:"La saisie {{ value }} est trop longue, le maximum est {{ limit }} caractères.")]
    private $title;

    #[Column(type:"text")]    
    #[Assert\NotBlank(message:"Le champs ne peut pas être vide.")]
    #[Assert\Regex(
        pattern:"/(?i)Plus belle la vie/", 
        match: false,
        message: "Ne fais plus jamais ça, on parle de vraies séries ici."
        )]
    private $summary;

    #[Column(type:"string", length:255, nullable:true)]
    #[Assert\Length(max:"255", maxMessage:"La saisie {{ value }} est trop longue, le maximum est {{ limit }} caractères.")]
    private $poster;

    
    #[ManyToOne(targetEntity:Category::class, inversedBy:"programs")]
    #[JoinColumn(nullable:false)]
    private $category;

    #[Column(type:"string", length:100, nullable:true)]
    #[Assert\Length(max:"100", maxMessage:"La saisie {{ value }} est trop longue, le maximum est {{ limit }} caractères.")]
    private $country;

    #[Column(type:"integer", length:4, nullable:true)]
    #[Assert\GreaterThan(1900, message: "La date doit être supérieure à 1900")]
    #[Assert\LessThan(2050, message: "La date doit être inférieure à 2050")]
    private $year;

    #[OneToMany(targetEntity:Season::class, mappedBy:"program", orphanRemoval:true)]
    private $seasons;

    public function __construct()
    {
        $this->seasons = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTitle(): ?string
    {
        return $this->title;
    }

    public function setTitle(string $title): self
    {
        $this->title = $title;

        return $this;
    }

    public function getSummary(): ?string
    {
        return $this->summary;
    }

    public function setSummary(string $summary): self
    {
        $this->summary = $summary;

        return $this;
    }

    public function getPoster(): ?string
    {
        return $this->poster;
    }

    public function setPoster(?string $poster): self
    {
        $this->poster = $poster;

        return $this;
    }

    public function getCategory(): ?Category
    {
        return $this->category;
    }

    public function setCategory(?Category $category): self
    {
        $this->category = $category;

        return $this;
    }

    public function getCountry(): ?string
    {
        return $this->country;
    }

    public function setCountry(?string $country): self
    {
        $this->country = $country;

        return $this;
    }

    public function getYear(): ?int
    {
        return $this->year;
    }

    public function setYear(?int $year): self
    {
        $this->year = $year;

        return $this;
    }

    /**
     * @return Collection|Season[]
     */
    public function getSeasons(): Collection
    {
        return $this->seasons;
    }

    public function addSeason(Season $season): self
    {
        if (!$this->seasons->contains($season)) {
            $this->seasons[] = $season;
            $season->setProgram($this);
        }

        return $this;
    }

    public function removeSeason(Season $season): self
    {
        if ($this->seasons->removeElement($season)) {
            // set the owning side to null (unless already changed)
            if ($season->getProgram() === $this) {
                $season->setProgram(null);
            }
        }

        return $this;
    }
}
