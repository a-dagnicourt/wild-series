<?php

namespace App\Controller;

use App\Entity\Category;
use App\Form\CategoryType;
use App\Repository\CategoryRepository;
use App\Repository\ProgramRepository;
use App\Service\Slugify;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

/** 
 * @Route("/categories", name="category_")
 */
class CategoryController extends AbstractController
{
    /**
     * @Route("/", name="index", methods={"GET"})
    */
    public function index(CategoryRepository $categoryRepository): Response
    {
        return $this->render('category/index.html.twig', [
            'categories' => $categoryRepository->findAll(),
        ]);
    }

    /**
     * @Route("/new", name="new", methods={"GET", "POST"})
     * @IsGranted("ROLE_ADMIN")
    */
    public function new(Request $request, Slugify $slugify) : Response
    {
        $category = new Category();
        $form = $this->createForm(CategoryType::class, $category);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $slug = $slugify->generate($category->getName());
            $category->setSlug($slug);
            $entityManager->persist($category);
            $entityManager->flush();

            $this->addFlash('success', 'La catégorie a été créée avec succès !');

            return $this->redirectToRoute('category_index');
        }
        return $this->render('category/new.html.twig', [
            'category' => $category,
            "form" => $form->createView(),
        ]);
    }


    /**
     * @Route("/{slug}", name="show", methods={"GET"})
     */
    public function show(Category $category, ProgramRepository $programRepository ): Response
    {
        if (!$category) {
            throw $this->createNotFoundException(
                'No category id n°'.$category.' found in category\'s table.'
            );
        }
        
    return $this->render('category/show.html.twig', [
        'category' => $category,
        'programs' => $programRepository->findBy(
            ['category' => $category],
            ['id' => 'DESC']
        )
    ]);
    }

    /**
     * @Route("/{slug}/edit", name="edit", methods={"GET", "POST"})
     * @IsGranted("ROLE_ADMIN")
     */
    public function edit(Request $request, Category $category, Slugify $slugify): Response
    {
        $form = $this->createForm(CategoryType::class, $category);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $slug = $slugify->generate($category->getName());
            $category->setSlug($slug);
            $this->getDoctrine()->getManager()->flush();

            $this->addFlash('success', 'La catégorie a été mise à jour avec succès !');

            return $this->redirectToRoute('category_index');
        }

        return $this->render('category/edit.html.twig', [
            'category' => $category,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{slug}", name="delete", methods={"POST"})
     * @IsGranted("ROLE_ADMIN")
     */
    public function delete(Request $request, Category $category): Response
    {
        if ($this->isCsrfTokenValid('delete'.$category->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($category);
            $entityManager->flush();

            $this->addFlash('danger', 'La catégorie a été supprimée avec succès !');
        }

        return $this->redirectToRoute('category_index');
    }    

    public function navbar(CategoryRepository $categoryRepository ): Response
    {
        return $this->render('_navbar_cat.html.twig', [
            'categories' => $categoryRepository->findBy([], ['id' => 'DESC'])
        ]);
    }
}
