<?php

namespace App\Controller;

use App\Entity\Episode;
use App\Entity\Program;
use App\Entity\Season;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
* @Route("/programs", name="program_")
*/
class ProgramController extends AbstractController
{
    /**
     * @Route("/", name="index")
     */
    public function index(): Response
    {
        $programs = $this->getDoctrine()
            ->getRepository(Program::class)
            ->findAll();

        return $this->render('program/index.html.twig', [
            'programs' => $programs
        ]);
    }

    /**
     * @Route("/{id}", requirements={"id"="\d+"}, methods={"GET"}, name="show")
     */
    public function show(int $id): Response
    {
        $program = $this->getDoctrine()
        ->getRepository(Program::class)
        ->findOneBy(['id' => $id]);

    if (!$program) {
        throw $this->createNotFoundException(
            'No program with id : '.$id.' found in program\'s table.'
        );
    }$seasons = $this->getDoctrine()
        ->getRepository(Season::class)
        ->findBy(
            ['program' => $program],
            ['year' => 'ASC']
        );

    return $this->render('program/show.html.twig', [
        'program' => $program,
        'seasons' => $seasons
    ]);
    }

    /**
     * @Route("/{programId}/seasons/{seasonId}", requirements={"programId"="\d+"}, methods={"GET"}, name="season_show")
     */
    public function seasonShow(int $programId, int $seasonId): Response
    {
        $program = $this->getDoctrine()
        ->getRepository(Program::class)
        ->findOneBy(['id' => $programId]);

    if (!$program) {
        throw $this->createNotFoundException(
            'No program with id : '.$programId.' found in program\'s table.'
        );
    }
    
    $season = $this->getDoctrine()
        ->getRepository(Season::class)
        ->findOneBy(
            ['id' => $seasonId]
        );

        $episodes = $this->getDoctrine()
        ->getRepository(Episode::class)
        ->findBy(
            ['season' => $seasonId]
        );

    return $this->render('program/season_show.html.twig', [
        'program' => $program,
        'season' => $season,
        'episodes' => $episodes
    ]);
    }
}
