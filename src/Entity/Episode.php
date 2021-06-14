<?php

namespace App\Entity;

use App\Repository\EpisodeRepository;
use Doctrine\ORM\Mapping\Column;
use Doctrine\ORM\Mapping\Entity;
use Doctrine\ORM\Mapping\GeneratedValue;
use Doctrine\ORM\Mapping\Id;
use Doctrine\ORM\Mapping\ManyToOne;
use Symfony\Component\Validator\Constraints as Assert;

#[Entity(repositoryClass:EpisodeRepository::class)]

class Episode
{
    #[Id]
    #[GeneratedValue()]
    #[Column(type:"integer")]
    private $id;

    #[ManyToOne(targetEntity:Season::class, inversedBy:"episodes")]  
    #[Assert\NotBlank(message:"Le champs ne peut pas être vide.")] 
    private $season;

    #[Column(type:"string", length:255)]
    #[Assert\NotBlank(message:"Le champs ne peut pas être vide.")]
    #[Assert\Length(max:"255", maxMessage:"La saisie {{ value }} est trop longue, le maximum est {{ limit }} caractères.")]
    private $title;

    #[Column(type:"integer")]
    #[Assert\GreaterThan(0, message: "Le numéro doit être supérieur à 0")]
    #[Assert\LessThan(500, message: "Le numéro doit être inférieur à 500")]    
    private $number;

    #[Column(type:"text")]       
    #[Assert\NotBlank(message:"Le champs ne peut pas être vide.")]
    private $summary;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getSeason(): ?Season
    {
        return $this->season;
    }

    public function setSeason(?Season $season): self
    {
        $this->season = $season;

        return $this;
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

    public function getNumber(): ?int
    {
        return $this->number;
    }

    public function setNumber(int $number): self
    {
        $this->number = $number;

        return $this;
    }

    public function getSummary(): ?string
    {
        return $this->summary;
    }

    public function setSummary(?string $summary): self
    {
        $this->summary = $summary;

        return $this;
    }
}
