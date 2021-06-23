<?php

namespace App\Controller;

use App\Entity\Season;
use App\Form\SeasonType;
use App\Repository\SeasonRepository;
use App\Service\Slugify;
use Symfony\Bridge\Twig\Mime\TemplatedEmail;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\ParamConverter;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Routing\Annotation\Route;


class SeasonController extends AbstractController
{
    /**
     * @Route("/seasons", name="season_index", methods={"GET"})
    */
    public function index(SeasonRepository $seasonRepository): Response
    {
        return $this->render('season/index.html.twig', [
            'seasons' => $seasonRepository->findAll(),
        ]);
    }

    /**
     * @Route("/programs/{programSlug}/create-season", name="season_new", methods={"GET", "POST"})
     * @ParamConverter("program", class="App\Entity\Program", options={"mapping": {"programSlug": "slug"}})
     * */
    public function new(Request $request, Slugify $slugify, MailerInterface $mailer): Response
    {
        $season = new Season();
        $form = $this->createForm(SeasonType::class, $season);
        $form->handleRequest($request);

        
        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $slug = $slugify->generate($season->getNumber());
            $season->setSlug($slug);
            $entityManager->persist($season);
            $entityManager->flush();
            
            $program = $season->getProgram();
            $subject = 'Une nouvelle saison de '. $program->getTitle() .' vient d\'être publiée !';
            $email = (new TemplatedEmail())
                ->from($this->getParameter('mailer_from'))
                ->to('email@test.com')
                ->subject($subject)
                ->htmlTemplate('season/newSeasonEmail.html.twig')
                ->context([
                    'season' => $season
                ]);

        $mailer->send($email);
            return $this->redirectToRoute('program_index');
        }

        return $this->render('season/new.html.twig', [
            'season' => $season,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/seasons/{slug}", name="season_show", methods={"GET"})
     */
    public function show(Season $season): Response
    {
        return $this->render('season/show.html.twig', [
            'season' => $season,
        ]);
    }

    /**
     * @Route("/programs/{programSlug}/season/{seasonNumber}/edit", name="season_edit", methods={"GET", "POST"})
     * @ParamConverter("program", class="App\Entity\Program", options={"mapping": {"programSlug": "slug"}})
     * @ParamConverter("season", class="App\Entity\Season", options={"mapping": {"seasonNumber": "number"}})
     */
    public function edit(Request $request, Season $season, string $programSlug, int $seasonNumber): Response
    {
        $form = $this->createForm(SeasonType::class, $season);
        $form->handleRequest($request);
        
        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();
            
            return $this->redirectToRoute('program_season_show', ['slug' => $programSlug, 'seasonNumber' => $seasonNumber]);
        }
        
        return $this->render('season/edit.html.twig', [
            'season' => $season,
            'form' => $form->createView(),
        ]);
    }
    
    /**
     * @Route("/programs/{programSlug}/season/{seasonNumber}", name="season_delete", methods={"POST"})
     * @ParamConverter("program", class="App\Entity\Program", options={"mapping": {"programSlug": "slug"}})
     * @ParamConverter("season", class="App\Entity\Season", options={"mapping": {"seasonNumber": "number"}})
     */
    public function delete(Request $request, Season $season, string $programSlug, int $seasonNumber): Response
    {
        if ($this->isCsrfTokenValid('delete'.$season->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($season);
            $entityManager->flush();
        }
        
        return $this->redirectToRoute('program_show', ['slug' => $programSlug]);
    }
}
