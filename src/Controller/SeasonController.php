<?php

namespace App\Controller;

use App\Entity\Program;
use App\Entity\Season;
use App\Form\SeasonType;
use App\Repository\SeasonRepository;
use Symfony\Bridge\Twig\Mime\TemplatedEmail;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\ParamConverter;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Routing\Annotation\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

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
     * @IsGranted("ROLE_CONTRIBUTOR")
     * */
    public function new(Request $request, MailerInterface $mailer, Program $program, string $programSlug): Response
    {
        $season = new Season();
        $season->setProgram($program);
        $form = $this->createForm(SeasonType::class, $season);
        $form->handleRequest($request);

        
        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $season->setSlug('s'.$season->getNumber().'-'.uniqid());
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
            return $this->redirectToRoute('program_show', ['slug' => $programSlug]);
        }

        return $this->render('season/new.html.twig', [
            'program' => $program,
            'season' => $season,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/programs/{programSlug}/season/{seasonSlug}", name="season_show", methods={"GET"})
     * @ParamConverter("program", class="App\Entity\Program", options={"mapping": {"programSlug": "slug"}})
     * @ParamConverter("season", class="App\Entity\Season", options={"mapping": {"seasonSlug": "slug"}})
     */
    public function show(Program $program, Season $season): Response
    {
        if (!$season) {
            throw $this->createNotFoundException(
                'No season id n°'.$season.' found in season\'s table.'
            );
        }

        return $this->render('season/show.html.twig', [
            'program' => $program,        
            'season' => $season
        ]);
    }

    /**
     * @Route("/programs/{programSlug}/season/{seasonSlug}/edit", name="season_edit", methods={"GET", "POST"})
     * @ParamConverter("program", class="App\Entity\Program", options={"mapping": {"programSlug": "slug"}})
     * @ParamConverter("season", class="App\Entity\Season", options={"mapping": {"seasonSlug": "slug"}})
     * @IsGranted("ROLE_CONTRIBUTOR")
     */
    public function edit(Request $request, Program $program, Season $season, string $programSlug): Response
    {
        $form = $this->createForm(SeasonType::class, $season);
        $form->handleRequest($request);
        
        if ($form->isSubmitted() && $form->isValid()) {            
            $season->setSlug('s'.$season->getNumber().'-'.uniqid());
            $this->getDoctrine()->getManager()->flush();
            
            return $this->redirectToRoute('season_show', ['programSlug' => $programSlug, 'seasonSlug' => $season->getSlug()]);
        }
        
        return $this->render('season/edit.html.twig', [
            'program' => $program,        
            'season' => $season,
            'form' => $form->createView(),
        ]);
    }
    
    /**
     * @Route("/programs/{programSlug}/season/{seasonSlug}", name="season_delete", methods={"POST"})
     * @ParamConverter("program", class="App\Entity\Program", options={"mapping": {"programSlug": "slug"}})
     * @ParamConverter("season", class="App\Entity\Season", options={"mapping": {"seasonSlug": "slug"}})
     * @IsGranted("ROLE_CONTRIBUTOR")
     */
    public function delete(Request $request, Season $season, string $programSlug): Response
    {
        if ($this->isCsrfTokenValid('delete'.$season->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($season);
            $entityManager->flush();
        }
        
        return $this->redirectToRoute('program_show', ['slug' => $programSlug]);
    }
}
