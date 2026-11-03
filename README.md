# Atlas — Team Prometheus

Atlas is a campaign participation layer for Portaldot protocols. Protocol teams publish structured campaigns; communities follow quests, submit useful proof and turn each accepted action into visible progress.

## Public demo

- **Demo:** https://portaldot-atlas.vercel.app/
- **Learn:** https://portaldot-atlas.vercel.app/learn

## Demo scene description

Atlas turns a campaign into a route that people can understand and complete. A participant opens the Campaign Board, chooses an active route and reads the quest rule, proof method, limits and reward boundary before starting. They complete a social, feedback or technical quest, submit the requested proof and follow its review state. Accepted participation advances the campaign journey: Campaign Score measures progress inside the campaign, Gems unlock eligible routes and rewards, and Rank records seasonal participation. The Reward Hub gives Gems a clear destination through fixed-choice Modules, Boosters and commemorative badges. The same experience also explains the protocol side: Campaign Studio helps teams design quests, publish rules, set bounded rewards and understand how their community moves through the campaign. The demo is designed to let a reviewer verify the complete path from discovery to proof, progress and reward in one coherent product.

## Technical highlights

The submission is a responsive React/Vite application with an accessible English/Spanish landing and an interactive Atlas dashboard. The UI uses Motion for lightweight transitions, responsive CSS layouts and a shared visual system for map routes, campaign cards, reward surfaces and protocol views. Portaldot wallet access is handled through the Polkadot extension interface without exposing signing secrets. Campaign state is modeled around explicit quest rules, proof requirements, review status, cooldowns and bounded reward sinks so the interface can explain what each action does before a participant commits to it. The application separates the participant journey from the protocol-team journey: Campaign Board and Reward Hub serve contributors, while Campaign Studio and campaign analytics describe the operator layer. The repository also includes a minimal EVM/revive `EvidenceAnchor` candidate under `contracts/` for the proof layer. The source is intentionally honest about deployment evidence: no private keys, seed phrases or unsupported contract address are included. The build is self-contained under `dashboard/`, uses a standard Vite production build and can be reproduced with the commands below.

## Run locally

```bash
cd dashboard
npm install
npm run dev
```

For a production build:

```bash
cd dashboard
npm run build
npm run preview
```

## Submission scope

This public snapshot contains the Atlas campaign, quest, proof, progress and reward experience prepared for the Portaldot Hacker House, plus the minimal proof-contract candidate in `contracts/`. The earlier observability prototype and server services remain in the original Atlas repository. The included code and assets are the complete runnable web experience for the submitted demo; any contract deployment claim must be backed by a real receipt and finality evidence.

## License

MIT. See [`LICENSE`](./LICENSE).
