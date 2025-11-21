# Roadmap: Projeto Kaiju Wars (Web/Mobile)

## Fase 1: A Fundação (Engine & Estrutura)
    - Objetivo: Criar a "espinha dorsal" do jogo que roda no navegador sem travar.

    -[x] 1.1 Configuração do Ambiente: Setup do Pygame-ce e Pygbag.

    - [] 1.2 Game Loop Assíncrono: Implementar o loop que conversa corretamente com o browser (HTML5).

    - [] 1.3 Gerenciador de Estados (State Machine): O sistema vital que permite ao jogo trocar entre "Menu", "Mapa Tático" e "Tela de Batalha". Sem isso, o código vira uma bagunça de if/else.

    - [] 1.4 Sistema de Resolução e Input: Configurar a tela 256x240 (NES) com upscaling automático e detecção básica de input (Teclado para PC, Toque simulado para Mobile).

## Fase 2: O Tabuleiro Tático (Core Loop A)
    - Objetivo: Implementar a visão estratégica onde os exércitos se movem.

    - [] 2.1 Sistema de Grid (Tilemap): Criar a matriz de dados (array 2D) que representa o mapa (rua, prédio, floresta).

    - [] 2.2 Renderização do Mapa: Desenhar o grid na tela de forma performática (desenhando apenas o que a câmera vê).

    - [] 2.3 O Cursor: Criar a mecânica de seleção (o quadrado que pisca e navega pelo grid), adaptada para aceitar toque na tela futuramente.

    - [] 2.4 Câmera/Scrolling: Fazer a tela seguir o cursor quando ele chega na borda do mapa.

## Fase 3: Unidades e Turnos
    - Objetivo: Popular o tabuleiro e criar as regras do jogo de xadrez.

    - [] 3.1 Classe Unidade (Entity System): Criar a classe Pai para Tanques, Caças e o Kaiju. Atributos: HP, Movimento, Alcance.

    - [] 3.2 Gerenciador de Turnos: Lógica de "Vez do Jogador" vs "Vez da CPU".

    - [] 3.3 Movimentação e Colisão: Algoritmo para calcular onde a unidade pode andar (ex: Tanque não anda na água, Jato voa sobre tudo).

    - [] 3.4 Interação com Cenário: Destruição de prédios ou obstrução de linha de visão.

## Fase 4: O Sistema de Combate (Core Loop B)
    - Objetivo: Recriar a tela de ação lateral estilo Arcade/Slot.

    - [] 4.1 Transição de Cena: Efeito visual de sair do mapa e entrar na luta.

    - [] 4.2 Interface de Batalha: Desenhar o cockpit ou visão do chão vs o sprite gigante do Kaiju.

    - [] 4.3 Mecânica de Mira (Slot Machine): A lógica específica deste jogo onde o sucesso do ataque depende de parar a roleta/mira no momento certo.

    - [] 4.4 Cálculo de Dano: Aplicar o dano baseado no resultado da mira e atualizar o estado da unidade.

## Fase 5: A IA do Kaiju (O "Boss")
    - Objetivo: Fazer o inimigo se comportar como no jogo original.

    - [] 5.1 IA de Mapa: O Kaiju deve priorizar destruir unidades próximas ou cidades? (Pathfinding básico).

    - [] 5.2 IA de Batalha: O comportamento do monstro durante a luta (atacar, defender, usar especial).

## Fase 6: Polimento e Deploy
    - Objetivo: Finalizar a experiência de usuário.

    - [] 6.1 Controles Mobile (Touch UI): Botões virtuais (D-Pad e A/B) na tela para quem joga no celular.

    - [] 6.2 Áudio: Efeitos sonoros (SFX) e trilha.

    - [] 6.3 Build Final: Compilação via Pygbag e teste final em servidor web.Roadmap: Projeto Kaiju Wars (Web/Mobile)
