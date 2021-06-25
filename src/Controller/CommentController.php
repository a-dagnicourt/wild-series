<?php

namespace App\Controller;

use App\Entity\Comment;
use App\Entity\Episode;
use App\Entity\Program;
use App\Entity\Season;
use App\Form\CommentType;
use App\Repository\CommentRepository;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\ParamConverter;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class CommentController extends AbstractController
{
    /**
     * @Route("/comments", name="comment_index", methods={"GET"})
    */
    public function index(CommentRepository $commentRepository): Response
    {
        return $this->render('comment/index.html.twig', [
            'comments' => $commentRepository->findAll(),
        ]);
    }
    
    /**
    * @Route("/comments/{id}", name="comment_show", methods={"GET"})
    */
    public function show(Comment $comment): Response
    {
        return $this->render('comment/show.html.twig', [
            'comment' => $comment,
        ]);
    }

    /**
    * @Route("/programs/{programSlug}/season/{seasonSlug}/episode/{episodeSlug}/comment/new", name="comment_new", methods={"GET", "POST"})
    * @ParamConverter("program", class="App\Entity\Program", options={"mapping": {"programSlug": "slug"}})
    * @ParamConverter("season", class="App\Entity\Season", options={"mapping": {"seasonSlug": "slug"}})
    * @ParamConverter("episode", class="App\Entity\Episode", options={"mapping": {"episodeSlug": "slug"}})
     */
    public function new(Request $request, Program $program, string $programSlug, Season $season, string $seasonSlug, Episode $episode, string $episodeSlug): Response
    {
        $comment = new Comment();
        $comment->setEpisode($episode);
        $comment->setAuthor($this->getUser());
        $form = $this->createForm(CommentType::class, $comment);
        $form->handleRequest($request);
        
        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($comment);
            $entityManager->flush();
            
            return $this->redirectToRoute('episode_show', ['programSlug' => $programSlug, 'seasonSlug' => $seasonSlug, 'episodeSlug' => $episodeSlug]);
        }
        
        return $this->render('comment/new.html.twig', [
            'program' => $program->getSlug($programSlug),
            'season' => $season->getSlug($seasonSlug),
            'episode' => $episode->getSlug($episodeSlug),
            'form' => $form->createView(),
        ]);
    }
    
    /**
     * @Route("/programs/{programSlug}/season/{seasonSlug}/episode/{episodeSlug}/comment/{commentId}", name="comment_edit", methods={"GET", "POST"})
     * @ParamConverter("program", class="App\Entity\Program", options={"mapping": {"programSlug": "slug"}})
     * @ParamConverter("season", class="App\Entity\Season", options={"mapping": {"seasonSlug": "slug"}})
     * @ParamConverter("episode", class="App\Entity\Episode", options={"mapping": {"episodeSlug": "slug"}})
     * @ParamConverter("comment", class="App\Entity\Comment", options={"mapping": {"commentId": "id"}})
     */
    public function edit(Request $request, Comment $comment, string $programSlug, string $seasonSlug, string $episodeSlug): Response
    {
        $form = $this->createForm(CommentType::class, $comment);
        $form->handleRequest($request);
        
        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();
            
            return $this->redirectToRoute('episode_show', ['programSlug' => $programSlug, 'seasonSlug' => $seasonSlug, 'episodeSlug' => $episodeSlug]);
        }
        
        return $this->render('comment/edit.html.twig', [
            'comment' => $comment,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/comments/{id}", name="comment_delete", methods={"POST"})
     */
    public function delete(Request $request, Comment $comment): Response
    {
        $episode = $comment->getEpisode();
        $episodeSlug = $episode->getSlug();
        $season = $episode->getSeason();
        $seasonSlug = $season->getNumber();
        $program = $season->getProgram();
        $programSlug = $program->getSlug();

        if ($this->isCsrfTokenValid('delete'.$comment->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($comment);
            $entityManager->flush();
        }

        return $this->redirectToRoute('episode_show', ['programSlug' => $programSlug, 'seasonSlug' => $seasonSlug, 'episodeSlug' => $episodeSlug]);
    }
}
