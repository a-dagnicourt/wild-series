<?php

namespace App\Controller;

use App\Entity\Episode;
use App\Entity\Program;
use App\Entity\Season;
use App\Form\EpisodeType;
use App\Repository\EpisodeRepository;
use App\Service\Slugify;
use Symfony\Bridge\Twig\Mime\TemplatedEmail;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\ParamConverter;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Routing\Annotation\Route;

class EpisodeController extends AbstractController
{
    /**
     * @Route("/episodes", name="episode_index", methods={"GET"})
    */
    public function index(EpisodeRepository $episodeRepository): Response
    {
        return $this->render('episode/index.html.twig', [
            'episodes' => $episodeRepository->findAll(),
        ]);
    }

    /**
    * @Route("/programs/{programSlug}/season/{seasonSlug}/create-episode", name="episode_new", methods={"GET", "POST"})
    * @ParamConverter("program", class="App\Entity\Program", options={"mapping": {"programSlug": "slug"}})
    * @ParamConverter("season", class="App\Entity\Season", options={"mapping": {"seasonSlug": "slug"}})
    */
    public function new(Request $request, Slugify $slugify, MailerInterface $mailer, Program $program, string $programSlug, Season $season, string $seasonSlug): Response
    {
        $episode = new Episode();
        $episode->setSeason($season);
        $form = $this->createForm(EpisodeType::class, $episode);
        $form->handleRequest($request);
        
        
        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $slug = $slugify->generate($episode->getTitle());
            $episode->setSlug($slug.'-'.uniqid());
            $entityManager->persist($episode);
            $entityManager->flush();
            
            $program = $episode->getSeason()->getProgram();
            $subject = 'Un nouvel épisode de '. $program->getTitle() .' vient d\'être publié !';
            $email = (new TemplatedEmail())
                ->from($this->getParameter('mailer_from'))
                ->to('email@test.com')
                ->subject($subject)
                ->htmlTemplate('episode/newEpisodeEmail.html.twig')
                ->context([
                    'episode' => $episode
                ]);

        $mailer->send($email);

        return $this->redirectToRoute('season_show', ['programSlug' => $programSlug, 'seasonSlug' => $seasonSlug]);
    }

        return $this->render('episode/new.html.twig', [
            'program' => $program,
            'season' => $season,
            'episode' => $episode,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/programs/{programSlug}/season/{seasonSlug}/episode/{episodeSlug}", name="episode_show", methods={"GET"})
     * @ParamConverter("program", class="App\Entity\Program", options={"mapping": {"programSlug": "slug"}})
     * @ParamConverter("season", class="App\Entity\Season", options={"mapping": {"seasonSlug": "slug"}})
     * @ParamConverter("episode", class="App\Entity\Episode", options={"mapping": {"episodeSlug": "slug"}})
     */
    public function show(Program $program, Season $season, Episode $episode): Response
    {
        if (!$episode) {
            throw $this->createNotFoundException(
                'No episode id n°'.$episode.' found in episode\'s table.'
            );
        }
        
        return $this->render('episode/show.html.twig', [
            'program' => $program, 
            'season' => $season,
            'episode' => $episode,
        ]);
    }

    /**
     * @Route("/programs/{programSlug}/season/{seasonSlug}/episode/{episodeSlug}/edit", name="episode_edit", methods={"GET", "POST"})
     * @ParamConverter("program", class="App\Entity\Program", options={"mapping": {"programSlug": "slug"}})
     * @ParamConverter("season", class="App\Entity\Season", options={"mapping": {"seasonSlug": "slug"}})
    * @ParamConverter("episode", class="App\Entity\Episode", options={"mapping": {"episodeSlug": "slug"}})
    */
    public function edit(Request $request, Program $program, Season $season, Episode $episode, Slugify $slugify, string $programSlug, string $seasonSlug): Response
    {
        $form = $this->createForm(EpisodeType::class, $episode);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $slug = $slugify->generate($episode->getTitle());
            $episode->setSlug($slug.'-'.uniqid());
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('episode_show', ['programSlug' => $programSlug, 'seasonSlug' => $seasonSlug, 'episodeSlug' => $episode->getSlug()]);
        }

        return $this->render('episode/edit.html.twig', [
            'program' => $program, 
            'season' => $season,
            'episode' => $episode,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/programs/{programSlug}/season/{seasonSlug}/episode/{episodeSlug}", name="episode_delete", methods={"POST"})
     * @ParamConverter("program", class="App\Entity\Program", options={"mapping": {"programSlug": "slug"}})
     * @ParamConverter("season", class="App\Entity\Season", options={"mapping": {"seasonSlug": "slug"}})
    * @ParamConverter("episode", class="App\Entity\Episode", options={"mapping": {"episodeSlug": "slug"}})
    */
    public function delete(Request $request, Episode $episode, string $programSlug, string $seasonSlug): Response
    {
        if ($this->isCsrfTokenValid('delete'.$episode->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($episode);
            $entityManager->flush();
        }

        return $this->redirectToRoute('season_show', ['programSlug' => $programSlug, 'seasonSlug' => $seasonSlug]);
    }
}
