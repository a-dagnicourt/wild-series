<?php

namespace App\Controller;

use App\Repository\ProgramRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class DefaultController extends AbstractController
{
    /**
     * @Route("/", name="app_index")
     */
    public function index(ProgramRepository $programRepository): Response
    {
        if ($this->getUser()) {
            $user = $this->getUser()->getId();
            $watchlist = $programRepository->findLikeViewer($user);
        } else {
            $watchlist = null;
        }

        return $this->render('index/index.html.twig', [
            'programs' => $programRepository->findBy(
                [],
                ['id' => 'DESC'],
                4,
                1
            ),
            'latestProgram' => $programRepository->findOneBy(
                [],
                ['id' => 'DESC']
            ),
            'watchlist' => $watchlist
        ]);
    }
}
