<%--
  Created by IntelliJ IDEA.
  User: zhuzeyong
  Date: 2021/8/17
  Time: 17:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        .tr1 {
            height: 60px;
            background: #dddddd;
        }

        .td1 {
            width: 350px;
            word-break: break-all;
        }

        .p1 {
            font-size: 30px;
            font-weight: bolder;
        }

        .p2 {
            font-size: 20px;
            font-weight: bolder;
        }

        table {
            width: 100%;
        }

        table td {
            border-bottom: 2px solid #f3f5f6;
            border-right: 2px solid #f3f5f6;
            line-height: 35px;
        }
    </style>
</head>
<body>
<p class="p1" style="text-align: center">大象能力平台通信技术服务协议</p>
<p>
    为使用大象能力平台通信技术服务，您应当阅读并遵守《大象能力平台通信技术服务协议》（以下简称“本协议”）。在接受本协议之前，请您务必仔细阅读本协议的全部内容，特别是免除或者限制责任的条款以及管辖法院的选择条款等，限制、免责条款可能以加粗形式提示您注意。无论是否实际阅读本协议，您通过网络页面点击确认本协议或实际使用大象能力平台服务，均表示您与大象能力平台和厦门集微科技有限公司（以下简称“大象”）已就本协议达成一致并同意接受本协议的全部约定内容。如果您不同意本协议的任意内容，或者无法准确理解大象能力平台对条款的解释，请不要同意本协议或使用本协议项下的服务。否则，表示您已接受了以下所述的条款和条件，同意受本协议约束。</p>
<p class="p2">第一条 定义</p>
1.1
大象能力平台通信技术服务：是大象提供的，面向开发者为主的互联网合作伙伴，提供融合大象能力平台通信的技术服务。开发者可利用大象提供的技术服务，通过大象能力平台，向用户提供以短信通知、短信验证码、语音通知、语音验证码服务等内容为主的技术服务。<br>
1.2 API接口： API （Application Programming Interface,应用程序编程接口）提供给开发人员的实现某一特定功能的接口，以下简称“接口”。<br>
1.3 ywId &
authz：指开发者在申请开发新应用时获得的由大象能力平台授予的应用程序接入业务ID和鉴权校验码。ywId是应用的唯一标识，大象能力平台通过ywId来鉴别应用发布者的身份。authz是大象能力平台给应用分配的密钥，该密钥在一定技术条件下可保证应用来源的可靠性。<br>
1.4 开发者：调用大象通信能力接口进行应用开发合作的主体，包括公司和个人，经过大象能力平台审核通过后成为本协议的开发者，以下简称“您”。
<p class="p2">第二条 服务内容</p>
大象能力平台将通信能力以API接口的形式提供给您调用，您根据自己的业务需要选择需要的服务，具体可选服务见网站www.capcplus.com页面。其中，厦门集微科技有限公司和大象能力平台提供企业通信技术服务，厦门集微科技有限公司和大象能力平台为您提供使用通信能力技术服务相关的售前、售中咨询服务。
<p class="p2">第三条 服务费用</p>
3.1 服务单价<br>
3.1.1 大象能力平台将根据不同服务种类收取技术服务费用，具体费用标准以网站页面展示为准。<br>
3.1.2 大象能力平台有权根据经营需要随时变更费用标准，并提前7天公示在网站上，自公示之日起7日后生效，如您不同意变更后的费用标准应立即停止使用，继续使用将视为同意并接受变更后费用标准。<br>
3.1.3 本服务的任何免费试用或免费功能和服务不应视为大象能力平台放弃后续收费的权利。大象能力平台有权提前7天以公告形式通知您收费标准，若您继续使用则需按大象能力平台公布的收费标准支付费用。<br>
3.2 账单服务<br>
3.2.1 大象能力平台向您提供使用本服务的账单，并根据账单计算和收取费用。<br>
3.3 付款方式<br>
3.3.1 本协议项下技术服务费的支付采用预充值方式，您向您的大象账户预存使用费，大象能力平台根据您所选择的服务进行计费，按实际使用量实时扣费，大象能力平台将根据您的预存账户余额情况进行费用预警，为了避免出现
API调用的中止或中断，您需及时补充预存费用，否则因账户余额不足而导致的一切风险及责任，均由您自行承担。<br>
3.3.2 您通过参与活动等方式获得大象能力平台赠予的代金券，在代金券使用有效期内，您使用通信能力技术服务所产生的费用将优先从代金券账户里进行扣除，逾期未使用直接作废。<br>
3.3.3 未尽事宜见网站各个通信能力服务内容及报价说明。
<p class="p2">第四条 您的权利及义务</p>
4.1开通服务<br>
4.1.1 开通服务：您需选择、申请相应的通信能力API调用权限，并确认相应的服务条款，在审核通过获得相应通信能力权限后，您可登陆管理控制台进行服务管理等操作。<br>
4.2使用规范<br>
4.2.1
您应当具备使用本服务的相关资质，您使用通信能力接口用于应用开发的，应同时具备相关开发的资质以及该应用提供服务应当具备的资质，并具备履行其基于本协议项下之义务的能力，您保证履行相关义务不违反任何对其有约束力的法律文件。您自行负责其应用的创作、开发、编辑、加工、修改、测试、运营及维护，并且自行承担相应的成本。<br>
4.2.2 您在使用大象能力平台服务时，必须遵守中华人民共和国相关法律法规的规定，您承诺将不会利用本服务进行任何违法或不正当的活动，否则大象能力平台有权停止向您提供服务。包括但不限于：<br>
a) 反对宪法所确定的基本原则的；<br>
b) 危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；<br>
c) 损害国家荣誉和利益的；<br>
d) 煽动民族仇恨、民族歧视，破坏民族团结的；<br>
e) 破坏国家宗教政策，宣扬邪教和封建迷信的；<br>
f) 散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的；<br>
g) 侮辱或者诽谤他人，侵害他人合法权益的；<br>
h) 未经他人同意传递商业等信息；<br>
i) 从事欺诈或诈骗行为的；<br>
j) 含有法律、行政法规禁止的其他内容的。<br>
k) 大象能力平台认为属于不正当的活动。<br>
4.2.4
您应采取有效措施，防止黑客攻击、盗用密码、非法调用页面等危害通信业务信息安全的非法行为。您应妥善保管使用本服务的接口、账号密码并保证自用终端和网络的安全性，使用账号密码从事的一切行为均视为您的行为，因账号密码丢失或被盗以及网络不安全产生的后果由您自行承担。<br>
4.2.5
您保证不得以任何方式或企图修改或干扰网站或其他大象能力平台网站及系统以及大象能力平台提供给您的网站、系统或代码的任何部分、功能。您违反上述条款，大象能力平台有权根据其情节，对您实施警告、限制服务、应用下线、应用删除、中止或终止服务等措施。<br>
4.2.6
您对自己在使用大象能力平台服务过程中的行为及与其客户之间的权利义务承担法律责任，您自主开发、独立运营其应用成果，大象能力平台不参与您应用的运营活动，您应依法进行应用的运营活动并独立承担相应的法律责任。您违反本协议或相关的服务条款的规定，导致或产生的任何第三方主张的任何索赔、要求或损失，您同意赔偿大象能力平台及其关联公司和合作公司，并使之免受损害。<br>
4.2.7 您应满足大象能力平台对接口的各项技术和商务规范要求。<br>
4.2.8 您不得将本协议服务、接口、数据等全部或部分出售或进行任何利益交换行为，也不得向任何第三方转借、转租或转授权等。<br>
4.2.9 您同意遵守大象能力平台制定的规则、规范等，并根据所选择服务遵守相应的附件中的使用规范。<br>
4.2.10 除符合适用法律的基本规定之外，您利用本服务向用户提供应用或服务时，未经用户同意不得擅自收集用户数据，不得违反法律或约定超出范围使用用户数据，应向用户提供隐私保护政策。<br>
4.2.11 您同意和理解：<br>
1）本协议项下通信能力技术服务均基于运营商能力和资源，由于通信能力、系统、网络和资源的不确定性，大象能力平台尽可能的维护能力的安全稳定，但对此不做任何保证；<br>
2）您自主开发、独立运营其应用成果，大象能力平台不参与您应用的运营活动，您应依法进行应用的运营活动并独立承担相应的法律责任。<br>
4.2.12
您开发的应用及服务应当重视用户体验，尊重用户知情权、选择权，应用服务应当坚持诚信原则，不误导、欺诈、混淆用户，尊重用户的隐私，不骚扰用户，不制造垃圾信息。如果因违反本条给用户造成的损害赔偿，应由您独立承担，若由此给大象能力平台造成任何损失的，您应当承担赔偿责任。大象能力平台有权自行判断和决定您的应用是否违反本协议约定、规则规范或侵犯用户合法权益，并对应用作出包括但不限于中止、限制或终止服务的处罚。<br>
4.2.13 除符合适用法律的基本规定之外，您应用或服务需要收集用户数据的应当符合以下条件：<br>
a) 您的应用或服务需要收集用户数据的，必须事先获得用户的授权，且仅可以收集为应用程序运行及功能实现目的而必要的用户数据。您应当告知用户相关数据收集的目的、范围及使用方式，保障用户知情权；<br>
b) 您应当就其应用向用户提供隐私保护政策，告知用户该应用收集哪些用户数据，如何使用，是否会将用户数据传播或提交他人等，保障用户的知情权及选择权。隐私政策在应用的界面上应当显示给用户；<br>
c) 您应当向用户提供修改、删除用户数据的方式，确保用户要求删除其用户数据时可通过该方式自行操作完成，并确保相关数据被完全删除；<br>
d) 您不得收集用户的隐私信息数据及其他大象能力平台认为属于敏感信息范畴的数据，包括但不限于不得收集或要求用户提供任何账号、密码，不得搜集或要求用户提供用户关系链、好友列表数据等；<br>
e) 您应当仅获取为应用程序运行及功能实现目的必要的数据；您在特定应用中收集的用户数据仅可以在该特定应用中使用，不得将收集的用户数据转移或使用在该特定应用之外；<br>
f) 未经大象能力平台授权，您不得使用大象能力平台提供的数据作为自身资源进行其它商业行为，包括但不限于收集、分享及对外宣传等；<br>
g) 您不得以任何形式将大象能力平台数据提供给任何非大象能力平台的第三方使用，您不得将用户数据出售、转让等；<br>
h) 如果大象能力平台认为您使用用户数据的方式，会损害用户体验，大象能力平台有权要求您删除相关数据并不得再以该方式使用用户数据；<br>
i)大象能力平台在您违反协议时有权限制或阻止您获取用户数据及大象能力平台数据；<br>
j) 您应当遵守大象能力平台关于用户数据的其他管理规则。<br>
4.2.14 大象能力平台运营数据的全部权利，均归属大象能力平台。未经大象能力平台事先书面同意，您不得为本协议约定目的外使用相关数据；<br>
4.2.15 一旦您停止使用大象能力平台或大象能力平台基于任何原因终止对您提供大象能力平台的服务，您必须立即停止使用并删除从大象能力平台中获得的全部服务和数据。<br>
4.2.16 您不得违约或违法使用大象能力平台的所有资源；您不得向任何单位或个人出售、转让、转授权大象能力平台的代码、API接口（Application Programming
Interface,应用程序编程接口）、开发工具以及其他大象能力平台服务资源等；您仅拥有依照本协议约定合法使用大象能力平台各项服务的权利。<br>
4.2.17 您不得利用大象能力平台从事以下活动：<br>
a) 未经允许，进入受保护的计算机信息网络或者使用计算机信息网络资源的；<br>
b) 未经允许，对计算机信息网络功能进行删除、修改或者增加的；<br>
c) 未经允许，对进入计算机信息网络中存储、处理或者传输的数据和应用程序进行删除、修改或者增加的；<br>
d) 故意制作、传播计算机病毒等破坏性程序的；<br>
e) 其他危害计算机信息网络安全的行为。
<p class="p2">第五条 大象能力平台权利义务</p>
5.1 大象能力平台如遇网络或系统维护或升级，需要暂停服务或要求您做出配合的，应当提前1个工作日告知您。<br>
5.2 大象能力平台向您提供可以实现统计查询、账单、详细话单、短信发送状态、呼叫状态等功能服务。<br>
5.3 大象能力平台有权对网站进行修改、升级等各项操作，并有权制定并修改服务内容及服务规范，规范一经发布在大象能力平台及其关联公司网站上即构成本协议的一部分，您应当予以遵守，否则您应当停止使用本服务，本协议自动终止。<br>
5.4
大象能力平台有权为预防、发现和调查欺诈、危害安全、非法或违反与您或其关联公司协议、政策或规则的行为对您服务进行检查监督。大象能力平台有权根据最终用户或第三方的投诉以及大象能力平台对您服务的监督检查，自行决定您及其客户是否利用本服务从事不正当活动，并以此中止或终止向您提供服务。<br>
5.5 大象能力平台有权在必要时变更部分或全部的服务功能，如功能变更可能引起日常服务的中断或终止，大象能力平台应当通知您，并尽快完成基本功能的修复。您可以选择继续使用调整后的服务功能，或终止使用大象能力平台服务。<br>
5.6 大象能力平台有权根据中国法律法规的调整、行政执法机关的命令和社会伦理道德的变化调整大象能力平台服务的标准。<br>
5.7 大象能力平台有权在必要时变更部分或全部的服务功能，如功能变更可能引起日常服务的中断或终止，大象能力平台应当在变更一个月之前事先通知您，并尽快完成基本功能的修复。您可以选择继续使用调整后的服务功能，或终止使用大象能力平台服务。<br>
5.8
您的应用及您所从事的经营业务不得对大象能力平台及其关联公司的利益构成任何现实或潜在的损害或冲突，否则大象能力平台有权立即通知您并终止大象能力平台向您提供的所有服务，而无需承担任何法律责任和费用补偿，同时大象能力平台保留追究您相应责任的权利。
<p class="p2">第六条 保密条款</p>
6.1
本协议所称保密信息，是指一方（以下简称“接受方”）从对方（以下简称“披露方”）取得的、获知的、或因双方履行本协议而共同创造且具有不可分割性的商业秘密（包括财务秘密）、技术秘密、经营诀窍和（或）其他应予保密的信息和资料，无论上述信息和资料以何种形式或载于何种载体，无论披露方在披露时是否以口头、图像或书面等方式表明其具有保密性。<br>
6.2 本协议有效期内及其终止后五年内，任何一方均不应向任何第三方披露、泄漏或提供保密信息。<br>
6.3 大象能力平台与您双方应采取适当措施妥善保存对方提供的保密信息，措施的审慎程度不少于其保护自身的保密信息时的审慎程度。双方仅能将保密信息用于与本协议项下的有关用途或目的。<br>
6.4 双方保证保密信息仅可在各自一方从事该业务的负责人和雇员范围内知悉。在双方上述人员知悉该保密信息前，应向其提示保密信息的保密性和应承担的义务，并以可证明的方式表明上述人员确实承担本协议项下的保密责任。<br>
6.5 如确有必要，接受方应按照保密信息披露方的指示将含有保密资料的所有文件或其他资料归还给披露方，或按其指示予以销毁。<br>
6.6 本条上述限制条款不适用于以下情况：<br>
a) 在签署本协议之时或之前，该保密信息已以合法方式属接受方所有；<br>
b) 保密信息在通知给接受方时，已经公开或能从公开领域获得；<br>
c) 保密信息是接受方从与其没有保密或不透露义务的第三方获得的；<br>
d) 在不违反本协议项约定责任的前提下，该保密信息已经公开或能从公开领域获得；<br>
e) 该保密信息是接受方或其关联或附属公司独立开发，而且未从通知方或其关联或附属公司获得的信息中获益；<br>
f) 接受方应法院或其它法律、行政管理部门要求披露的信息（通过口头提问、询问、要求资料或文件、传唤、民事或刑事调查或其他程序）因而透露保密信息，在该种情况发生时，接受方应立即向披露方发出通知，并作出必要说明。<br>
6.7 大象能力平台与您双方亦对本协议的具体内容负有保密责任。<br>
6.8 大象能力平台与您双方为了履行本协议而进行的沟通、通知、告知等文件传递或文件交换，应由双方妥善保存，不得用于不利于双方开展业务的目的。双方不得诋毁诽谤对方，亦不得在公开场合以攻击对方为目的发布不利于双方的言论。
<p class="p2">第七条 知识产权</p>
7.1
网站上所有内容，包括但不限于著作、图片、档案、资讯、资料、网站架构、网站画面的安排、网页设计，均由大象能力平台或其他权利人依法拥有其知识产权。非经大象能力平台或其他权利人书面同意任何人不得擅自使用、修改、复制、公开传播、改变、散布、发行或公开发表网站程序或内容。<br>
7.2 未经大象能力平台同意，您不得擅自使用您或其关联公司的商标、名称以及大象能力平台相关商标及其标识。<br>
7.3
开发者独立开发的应用的知识产权归其该所有人所有；权利人同意授予大象能力平台及其关联公司在全球范围内享有免费的、永久性的、不可撤消的、非独家的、可转让、可分许可的许可，许可大象能力平台应用开发平台使用、调用、演示产品等。该许可不受双方合作终止以及本协议终止的影响。<br>
7.4
本协议项目合作涉及的系统、代码、数据、品牌等，均由双方各自依法拥有知识产权，未经权利拥有一方的书面同意，另一方不得擅自使用、修改、复制、公开传播、发行，否则，权利拥有一方有权立即终止本协议并要求对方赔偿全部损失（包括但不限于调查取证费用、公证费用、律师费等）。<br>
7.5您不得将大象能力平台基于本项目合作提供的技术接口、源代码及算法等进行反向工程、反汇编、重构、反编译、翻译、修改、复制，或者在未经明确允许的情况下创作衍生作品。
<p class="p2">第八条 免责条款</p>
8.1
您充分理解，使用大象能力平台的通信通道涉及到因特网、电信运营商的网络服务，可能会受到各个环节不稳定因素的影响，因此您同意，对因停电、计费系统故障、传输线路故障、通信故障及通信线路故障、检修升级、计算机错误或病毒、黑客攻击、信息损坏、数据丢失或其它在大象能力平台合理控制范围之外的原因所造成的中断、延迟或停顿等服务问题，大象能力平台不承担责任；为防止发生意外，请您不要仅依靠网络作为重要情况下使用的唯一通信工具，对于您利用大象能力平台服务开展活动而造成的损失，双方同意大象能力平台不向您或任何第三方承担责任。<br>
8.2 大象能力平台有权定期或不定期地对提供网络服务的网站或相关的设备进行检修或者维护，如因此类情况而造成网络服务在合理时间内的中断或暂停，大象能力平台无需为此承担任何责任。<br>
8.3 如发生下述任一情况而导致服务中断及您损失的，大象能力平台不承担责任：<br>
1) 发生不可抗力情形的；<br>
2) 黑客攻击、计算机病毒侵入或发作的；<br>
3) 计算机系统遭到破坏、瘫痪或无法正常使用的；<br>
4) 因政府管制而造成中止或终止服务的；<br>
5) 其它非因大象能力平台的过错而引起的。<br>
8.4 在任何情况下，大象能力平台均不就因使用大象能力平台提供的服务所发生的任何间接性、后果性、惩戒性、偶然性、特殊性的损害，包括您使用大象能力平台服务而遭受的利润损失承担责任（即使您已事先被告知该等损害发生的可能性）。<br>
8.5 在任何情况下，大象能力平台对本协议项下提供的服务所承担的违约赔偿责任总额不超过违约服务对应之服务费总额。
<p class="p2">第九条 不可抗力</p>
因不可抗力或者其他意外事件，使得本协议的履行不可能、不必要或者无意义的，遭受不可抗力、意外事件的一方不承担责任。不可抗力、意外事件是指不能预见、不能克服并不能避免且对一方或双方当事人造成重大影响的客观事件，包括但不限于自然灾害如洪水、地震、瘟疫流行等以及社会事件如战争、动乱、政府行为、电信主干线路中断、黑客、网路堵塞、电信部门技术调整和政府管制等。
<p class="p2">第十条 协议的终止</p>
10.1 在您违反本协议约定或网站规则、规范时，大象能力平台有权随时暂停或终止向您提供服务。如您后续再直接或间接或以他人名义注册并登录的，大象能力平台有权直接单方面暂停或终止提供本协议下服务。<br>
10.2 如本协议服务终止，大象能力平台有权保留或删除您账号中的任何信息和全部相关数据，包括服务终止前您尚未完成的任何数据。<br>
10.3 因法律法规或政策原因导致大象能力平台业务无法继续运营的，双方合同自动解除，互不承担违约责任。<br>
10.4 由于客观原因，致使您不能使用服务时，大象能力平台不承担任何责任，包括但不限于<br>
a)自然灾害，如台风、洪水、冰雹等；<br>
b)政府行为，如征收、征用等；<br>
c)社会异常事件，如罢工、骚乱等；<br>
d)计算机病毒或黑客攻击、互联网络、通信线路等原因造成服务中断。<br>
10.5 鉴于通信服务的特殊性和不可控性，大象能力平台可能随时中断或终止部分或全部的服务。如出现以上情形，除本协议所述不可抗拒因素外，大象能力平台将以合理的方式通知您。
<p class="p2">第十一条 违约责任</p>
11.1 任何一方未履行本协议项下的任何一项条款均被视为违约。违约方应按照本协议的相关约定，依法承担相应违约责任。<br>
11.2
除本协议另有约定外，任何一方违反其于本协议项下的陈述、承诺、保证或义务，而使另一方遭受任何诉讼、纠纷、索赔、处罚等的，违约方应负责解决，使另一方发生任何费用、额外责任或遭受经济损失的，应当负责赔偿。如一方发生违约行为，守约方可以书面通知方式要求违约方在指定的时限内停止违约行为，要求其消除影响。如违约方未能按时停止违约行为，则守约方有权立即终止本协议。<br>
11.3
如果因您违反本协议，而导致任何其他第三方遭受任何损失并引起纠纷，且该等纠纷解决的结果最终导致大象能力平台承担了任何责任，则您全额赔偿大象能力平台受到的损失。涉及第三方纠纷时,大象能力平台应及时知会您,双方共同协商,本着友好互谅的原则进行处理。
<p class="p2">第十二条 争议解决</p>
本协议履行中若发生争议，双方应当本着互谅互让的原则，协商解决。协商不成的，任何一方均有权向厦门市集美区人民法院提起诉讼。
<p class="p2">第十三条 协议的生效、续签及其他</p>
13.1 本协议内容包括协议正文及所有大象能力平台已经发布的或将来可能发布的相关规则。上述规则为本协议不可分割的一部分，与本协议正文具有同等法律效力。<br>
13.2 双方未行使或未执行本协议任何权利或规定，不构成对前述权利之放弃。<br>
13.3 本协议项下大象能力平台对开发者所有的通知均可通过网页公告、电子邮件、手机短信或常规的信件传送等方式进行；该等通知于发送之日视为已送达收件人。<br>
13.4 本协议如有调整和更新会提前7天在本网站做网页公告，如果您不接受更新后的内容，可以在7天之内邮件或书面告知大象能力平台终止提供服务。如果7天之内大象能力平台未收到终止服务的申请，默认您同意协议的调整和更新。<br>
13.5 若本协议中部分条款因任何原因而被认定无效，此种无效条款并不影响其他条款的有效性，且此种无效条款应自始视为不存在。<br>
13.6 协议终止后，有关知识产权、数据信息保密的条款不因协议的终止而终止。</p>
</body>
</html>
