## API

### SOAP

SOAP (*Simple Object Access Protocol*) est une spécification de protocole de messages pour des
échanges d'information structurée dans l'implémentation de webs services à travers un réseau
informatique. Son objectif est de fournir extensibilité, neutralité, verbosité et indépendance. Elle
utilise un ensemble d'information XML pour son format de message, et s'appuie sur des protocoles de
la couche application, la plupart du temps HTTP, bien que certains anciens systèmes communiquent via
SMTP, pour la négociation et la transmission de messages.

SOAP permet aux développeurs d'invoquer des processus s'exécutant sur des systèmes d'exploitation
disparates d'authentifier, d'autoriser, et de communiquer à l'aide du langage de balisage extensible
(XML). Puisque les protocoles webs tels que HTTP sont installés et actifs sur tous les systèmes
d'exploitation, SOAP permet aux clients d'invoquer des services webs et de recevoir des réponses
indépendantes du langage et des plateformes.

SOAP fournit la couche de protocole de messages de la pile de protocoles des webs services. C'est un
protocole basé sur le langage XML qui consiste en trois parties :

* Une enveloppe, qui définit la structure du message et la façon de le traiter.
* Un ensemble de règles d'encodage afin d'exprimer des instances de types de données définis par
  application.
* Une convention pour représenter les appels de procédures et leurs réponses.

SOAP a trois caractéristiques majeures :

1. l'extensibilité
2. la neutralité (SOAP peut opérer à travers des protocoles tels que HTTP, SMTP, TCP, UDP)
3. l'indépendance (SOAP ne contraint en aucune façon le modèle de programmation)

L'architecture SOAP consiste en plusieurs couches de spécifications pour :

* le format de message
* les motifs d'échange de message (MEP)
* les liens au protocole de transport sous-jacent
* les modèles de traitement de messages
* l'extensibilité du protocole

SOAP a évolué en tant que successeur de XML-RPC, bien qu'il emprunte son transport et la neutralité
d'interaction de l'adressage des webs services et l'enveloppe/entête/corps d'autres modèles.

La spécification SOAP peut être grossièrement définie comme étant constituée des 3 composants
conceptuels suivants : les concepts de protocole, les concepts d'encapsulation et les concepts de
réseau.

**SOAP** est un ensemble de règles qui formalisent et gouvernent le format et les règles de
traitement pour l'information échangé entre l'émetteur et le receveur SOAP.

**Les noeuds SOAP** sont des machines physiques/logiques avec des unités de traitement utilisées
pour transmettre/relayer, recevoir et traiter les messages SOAP. Ils sont analogues aux noeuds d'un
réseau.

**Les rôles SOAP** sont les rôles spécifiques qu'assument chacun des noeuds, à travers le chemin
d'un message SOAP. Le rôle du noeud définit l'action que le noeud doit effectuer sur le message
qu'il reçoit. Par exemple, un rôle *none* signifie qu'aucun noeud ne traitera l'entête SOAP en
aucune façon et transmettra simplement le message le long de son chemin.

**Les liens aux protocoles SOAP** sont les interactions du message SOAP travaillant en conjonction
des autres protocoles afin de transférer un message SOAP à travers le réseau. Par exemple, un
message SOAP peut utiliser TCP comme sous-couche protocolaire pour le transfert de messages. Ces
liens sont définis dans le cadre des liens aux protocoles sous-jacent SOAP.

**Les fonctionnalités SOAP** permettent d'étendre le cadre de message SOAP pour ajouter des
fonctions telles que la fiabilité, la sécurité etc. Il existe des règles à suivre lors de l'ajout de
fonctionnalités au cadre SOAP.

**Les modules SOAP** sont une collection de spécifications concernant la sémantique des entêtes SOAP
pour décrire une nouvelle fonctionnalité étendue s'ajoutant à SOAP. Un module requiert zéro ou
plusieurs fonctionnalités. SOAP a besoin des modules pour adhérer au règles prescrites.

**Le message SOAP** représente l'information échangée entre 2 noeuds SOAP.

**L'enveloppe SOAP** est l'ensemble des éléments délimiteurs d'un message XML qui l'identifie comme
étant un message SOAP.

**Le bloc d'entête SOAP** est un bloc de traitement discret contenu dans l'entête qui elle peut en
contenir plusieurs. En général, l'information du rôle SOAP est utilisée pour cibler des noeuds du
chemin. Un bloc d'entête est dit être ciblé sur un noeud SOAP si le rôle SOAP du bloc d'entête est
le nom d'un rôle dans lequel le noeud SOAP opère. Par exemple le bloc d'entête SOAP avec l'attribut
de rôle *ultimateReceiver* est ciblé seulement au noeud destination qui a ce rôle. Un entête avec un
attribut de rôle *next* est ciblé pour chaque intermédiaire ainsi que le noeud destination.

**L'entête SOAP** est une collection d'un ou de plusieurs blocs d'entêtes ciblés pour chaque
receveurs SOAP.

**Le corps SOAP** contient le corps du message à l'attention du receveur SOAP. L'interprétation et
le traitement du corps SOAP est défini par le blocs d'entêtes.

**L'erreur SOAP** est un élément qui contient l'information d'erreur dans le cas où un noeud SOAP
échoue à traiter un message SOAP. Cet élément est contenu dans le corps SOAP en tant qu'élément
enfant.

**L'émetteur SOAP** est un noeud qui transmet un message SOAP.

**Le receveur SOAP** est un noeud recevant un message SOAP. (Il peut s'agir d'un noeud intermédiaire
ou d'un noeud destination)

**Le chemin du message SOAP** est l'ensemble des noeuds que le message SOAP a traversé pour
atteindre le noeud destination.

**L'émetteur initial SOAP** est le noeud à l'origine de message SOAP à transmettre. C'est la racine
du chemin du message SOAP.

**L'intermédiaire SOAP** est le noeud situé entre l'émetteur initial et la destination SOAP voulue.
Il traite les blocs d'entête ciblés sur lui et agit pour relayer un message SOAP vers son ultime
receveur SOAP.

**L'ultime receveur SOAP** est le receveur destinataire du message SOAP. Ce noeud est responsable du
traitement du corps du message et des blocs d'entête ciblés sur lui.

La spécification SOAP définit un cadre de messages, qui consiste en :

* Le **modèle de traitement SOAP**, définissant les règles pour traiter un message SOAP.
* Le **modèle d'extensibilité SOAP**, définissant les concepts de fonctionnalités et de modules
  SOAP.
* Le **cadre de liens aux protocoles sous-jacents** décrivant les règles définissant les liens aux
  protocoles sous-jacents pouvant être utilisés lors des échanges de messages entre noeuds SOAP.
* Le **concept de message SOAP** définissant la structure d'un message SOAP.

Un message SOAP est un document XML ordinaire contenant les éléments suivants :

<table>
<tr>
    <th>Élément</th>
    <th>Description</th>
    <th>Requis</th>
</tr>
<tr>
    <td>Enveloppe</td>
    <td>Identifie le document XML en tant que message SOAP</td>
    <td>Oui</td>
</tr>
<tr>
    <td>Entête</td>
    <td>Contient les informations d'entête</td>
    <td>Non</td>
</tr>
<tr>
    <td>Corps</td>
    <td>Contient les informations d'appel et de réponse</td>
    <td>Oui</td>
</tr>
<tr>
    <td>Erreur</td>
    <td>Fournit des informations à propos d'erreurs ayant eu lieu lors du traitement du message</td>
    <td>Non</td>
</tr>
</table>

À la fois SMTP et HTTP sont des protocoles de la couche application valides en tant que transports
pour SOAP, mais HTTP est plus largement utilisé du fait qu'il fonctionne bien avec l'infrastructure
internet ; spécifiquement, HTTP fonctionne bien avec les pare-feu réseaux. SOAP peut également être
utilisé par dessus HTTPS (qui est le même protocole qu'HTTP au niveau application, mais utilise un
protocole de transport chiffré en dessous) avec une authentification simple ou mutuelle ; c'est la
méthode utilisée pour fournir une sécurité au niveau des webs services.

L'ensemble des informations XML a été choisi comme format de message standard du fait de son très
large usage dans l'industrie et des efforts de développements open source. Typiquement, l'ensemble
des informations XML est sérialisé comme du XML.
