# main.py

import asyncio # Para rodar no navegador
import pygame
import sys
from src.settings import * # Trazendo suas cores e configurações

async def main():
    # --- 1. Setup Inicial ---
    pygame.init()

    # Cria a janela. 
    # O flag SCALED é o segredo para o estilo retro funcionar bem em telas modernas
    screen = pygame.display.set_mode((LARGURA_VIRTUAL, ALTURA_VIRTUAL), pygame.SCALED)
    pygame.display.set_caption(TITLE)

    clock = pygame.time.Clock()
    running = True

    # --- 2. Loop Principal ---
    while running:
        # A. "Ouvir" o jogador (INPUTS)
        for event in pygame.event.get():
            if event.type == pygame.QUIT: running = False

            # Atalho pra fechar rápido no PC
            elif event.type == pygame.KEYDOWN:
                if event.key == pygame.K_ESCAPE: running = False

        # B. Desenhar na tela
        screen.fill(COLOR_BG_MAP) # Pinta a tela com a cor definida

        # C. Atualizar o monitor
        pygame.display.flip()

        # D. Controle de FPS
        clock.tick(FPS)

        # E. Respiro para o Navegador (Vital para web!)
        await asyncio.sleep(0)

    pygame.quit()
    sys.exit()


# Se e4stiver rodando direto esse arquivo, inicie o processo assíncrono
if __name__ == "__main__": asyncio.run(main())
