<?php

namespace App\Controller;

use App\Entity\Program;
use App\Form\ProgramType;
use App\Form\SearchProgramType;
use App\Repository\ProgramRepository;
use App\Service\Slugify;
use Symfony\Bridge\Twig\Mime\TemplatedEmail;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Exception\AccessDeniedException;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Component\HttpFoundation\Session\SessionInterface;

/** 
 * @Route("/programs", name="program_")
 */
class ProgramController extends AbstractController
{
    /**
     * @Route("/", name="index", methods={"GET", "POST"})
    */
    public function index(SessionInterface $session, Request $request, ProgramRepository $programRepository): Response
    {
        $searchProgramForm = $this->createForm(SearchProgramType::class);
        $searchProgramForm->handleRequest($request);

        if ($searchProgramForm->isSubmitted() && $searchProgramForm->isValid()) {
            $search = $searchProgramForm->getData()['search'];
            $programs = $programRepository->findLikeName($search);
        } else {
            $programs = $programRepository->findAll();
        }

        return $this->render('program/index.html.twig', [
            'programs' => $programs,
            "searchProgramForm" => $searchProgramForm->createView(),
        ]);
    }

    /**
     * @Route("/new", name="new", methods={"GET", "POST"})
     * @IsGranted("ROLE_CONTRIBUTOR")
    */
    public function new(Request $request, Slugify $slugify, MailerInterface $mailer) : Response
    {
        $program = new Program();
        $form = $this->createForm(ProgramType::class, $program);
        $form->handleRequest($request);
        
        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $slug = $slugify->generate($program->getTitle());
            $program->setSlug($slug);
            $program->setOwner($this->getUser());
            $entityManager->persist($program);
            $entityManager->flush();

            $email = (new TemplatedEmail())
                ->from($this->getParameter('mailer_from'))
                ->to('email@test.com')
                ->subject('Une nouvelle série vient d\'être publiée !')
                ->htmlTemplate('program/newProgramEmail.html.twig')
                ->context([
                    'program' => $program
                ]);

        $mailer->send($email);

        $this->addFlash('success', 'La série a été créée avec succès !');

            return $this->redirectToRoute('program_index');
            
        }
        return $this->render('program/new.html.twig', [
            'program' => $program,
            "form" => $form->createView(),
        ]);
    }

    /**
     * @Route("/{slug}", name="show", methods={"GET"})
     */
    public function show(Program $program): Response
    {
        if (!$program) {
        throw $this->createNotFoundException(
            'No program id n°'.$program.' found in program\'s table.'
        );
    }

    return $this->render('program/show.html.twig', [
        'program' => $program,
        'seasons' => $program->getSeasons()
    ]);
    }

    /**
     * @Route("/{slug}/edit", name="edit", methods={"GET", "POST"})
     * @IsGranted("ROLE_CONTRIBUTOR")
     */
    public function edit(Request $request, Program $program, Slugify $slugify): Response
    {
        if (!($this->getUser() == $program->getOwner())) {
            throw new AccessDeniedException('Only the owner can edit the program.');
        }

        $form = $this->createForm(ProgramType::class, $program);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $slug = $slugify->generate($program->getTitle());
            $program->setSlug($slug);
            $this->getDoctrine()->getManager()->flush();

            $this->addFlash('success', 'La série a été mise à jour avec succès !');

            return $this->redirectToRoute('program_index');
        }

        return $this->render('program/edit.html.twig', [
            'program' => $program,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{slug}", name="delete", methods={"POST"})
     * @IsGranted("ROLE_CONTRIBUTOR")
     */
    public function delete(Request $request, Program $program): Response
    {
        if ($this->isCsrfTokenValid('delete'.$program->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($program);
            $entityManager->flush();

            $this->addFlash('danger', 'La série a été supprimée avec succès !');
        }

        return $this->redirectToRoute('program_index');
    }
}
