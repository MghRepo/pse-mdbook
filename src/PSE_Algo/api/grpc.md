## API

### gRPC

gRPC est un système d'appel de procédures distantes. Il utilise HTTP/2 pour le transport, et protobuf en tant que langage de
description d'interface, et fournit des fonctionnalités telles que l'authentification, le streaming bidirectionnel et le
contrôle de flux, les liaisons bloquantes ou non bloquantes, l'annulation et les dépassements de délais. Il génère des liaisons
entre les clients multi-plateformes et le serveur pour de nombreux langages. Les usages généraux incluent l'interconnexion de
services dans un style architectural microservices, ou la connexion de clients mobiles à des services backend.

gRPC supporte l'usage de TLS et d'une authentification basée token. Il y a deux types de certificats : les certificats de
canaux et les certificats d'appels.

gRPC utilise protobuf pour encoder la donnée. Contrairement aux APIs HTTP avec JSON, elles obéissent à une spécification
stricte.
