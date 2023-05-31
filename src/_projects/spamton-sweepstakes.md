---
layout: project
title: Spamton Sweepstakes
date: 2022-09-19
description: |
  Charity event for DELTARUNE, celebrating UNDERTALE's 7th anniversary.
  Raised over $350,000 for charity.
tags:
  - front-end
  - websockets
  - serverless
thumb: projects-spamton-thumb.png
images:
  - projects-spamton-1.png
  - projects-spamton-2.png
  - projects-spamton-3.png
live_url: https://deltarune.com/sweepstakes/
---

Charity event for DELTARUNE, celebrating UNDERTALE's 7th anniversary. Raised over $350,000 for Child's Play and Pakistan flood relief charities. Built over the course of a month in a team of myself, another developer, and a designer. Designed to look and feel like a spammy web 1.0 site, with secret alternate web 1.0 sites buried within.

Uses the CloudFlare Workers serverless stack. Updates were fetched from Tiltify and eBay, cached, and served via WebSocket (or polling, if WebSockets were unavailable).
