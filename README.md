# SIGIL RPG – Ordem Paranormal (Frontend Flutter)

Aplicativo Flutter para gerenciamento de campanhas e fichas baseado no sistema Ordem Paranormal. Este repositório contém o frontend inicial (sem backend), estruturado em MVC e com foco em uma UI dark, moderna e responsiva.

## ⚙️ Stack
- Flutter (Material 3, tema dark customizado)
- Gerenciamento de estado com Provider (para Dice Roller e fácil expansão)

## 🗂️ Arquitetura (MVC)
```
lib/
├── models/           # Entidades e modelos de dados
├── views/            # Telas e fluxos (Home, Characters, Campaigns, Teams, Dice)
├── controllers/      # Lógica de negócio e estado leve
├── widgets/          # Componentes UI reutilizáveis
├── utils/            # Utilitários (ex: dice roller)
└── constants/        # Cores, tema e rotas
```

## ✅ Implementado
- Tema dark custom (cores, tipografia e componentes base)
- Navegação por rotas nomeadas
- Home com atalhos para Personagens, Campanhas, Equipes e Rolador de Dados
- Telas:
  - CharactersListView (lista com mock e navegação)
  - CharacterDetailView (abas: Combate, Habilidades, Rituais, Inventário, Descrição)
  - CharacterCreateView – Wizard (6 etapas): básicas, atributos, origem, classe, perícias/habilidades, equipamento
  - CampaignsView, TeamsView (placeholders)
  - DiceView usando Provider + `DiceRoller` com histórico
- Widgets reutilizáveis:
  - AttributeCircle, SkillRow, CharacterCard, HealthBar, DiceRoller
- Utils: `Dice` (rolagens genéricas e d20)

## 📦 Modelos de dados (parcial)
- Character (básico, para lista e detalhe)
- Skill, Item, Ability, Attack, Session, Campaign, Team (com SharedMap/Note)

## 🚧 Em andamento / Próximos passos
- Ficha (Combate): listar perícias com `SkillRow`, ataques equipados e defesas calculadas
- Inventário: CRUD, categorias e cálculo de peso/carga
- Persistência local: Hive/SQLite + repositórios
- Integração de estado: expandir Provider/Riverpod para personagens/campanhas/equipes
- Validações/cálculos: NEX, distribuição de pontos, modificadores, defesas, resistências
- UI/UX: ícones temáticos, animações sutis, responsividade e acessibilidade
- Testes: widget tests para telas e utilitários

## 🌐 Futuro: Backend (Opcional)
Uma API com FastAPI pode prover:
- Autenticação (JWT) e perfis
- Persistência centralizada (personagens, campanhas, equipes, mapas, anotações)
- Colaboração/sincronização multi-dispositivo
- Upload/serving de arquivos (avatars/mapas)
- Endpoints REST e, opcionalmente, WebSockets para tempo real (rolagens e chat)

## ▶️ Rodando o projeto
1) Tenha Flutter instalado e configurado
2) Instale dependências
```
flutter pub get
```
3) Execute
```
flutter run
```

## 📁 Rotas principais
- `/` Home
- `/characters` Lista de personagens
- `/characters/create` Wizard de criação
- `/characters/{id}` Detalhe (roteamento dinâmico via `onGenerateRoute`)
- `/campaigns` Campanhas
- `/teams` Equipes
- `/dice` Rolador de Dados

---

Este é um frontend inicial com base sólida para evoluir: começamos pelo sistema de personagens, rolador de dados e estrutura de telas. Futuras fases incluem persistência local, colaboração e possível backend FastAPI.
