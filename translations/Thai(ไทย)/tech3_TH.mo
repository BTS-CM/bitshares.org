��    <      �  S   �      (  �   )  =   �  [   �  i   M  
   �  (  �  n   �  D   Z	  
   �	  P   �	  =   �	     9
     A
  v   H
     �
    �
  �   �  \   f  E   �     	  &    �   E  �  �  Q   m  �  �  O   �  A     (   I     r  �   ~  �    a   �     "     8     ?  >   K     �  B   �     �  �   V  h   �  �   e  .  ?  �   n  ^     }  e  k   �  Y   O  D   �  �   �  �  �  ?  &   �  f!     0#     9#  P   G#  V   �#  F  �#  �  6%  �  �&    ^(  �   f)  �   	*  �   �*     �+  j  �+  ,  d1  �   �2     Q3  �   g3  �   4     �4     �4  
  �4  ^   �5  �  <6    9  �   :  �   �:  0   �;  �  '<  �  �>  F  �@  �   �C  �  �D  �   RI  �   J  j   �J     MK  -  mK    �L  �   �P  C   �Q     �Q  $   �Q  �   
R  !   �R  �   �R  *  pS  {  �T  �   V  [  �V    LX  [  ^[  �   �\  :  p]    �`  �   �a  �   �b  �  uc  �  $e  H  	i  C  Rl  X   �p     �p  �   q  �   �q    �r  �  �u        3   %   -             !   *                #       8   &       .   9      +   '                   6                        $   <             5   ,       "                 :              
      1                 2                     (   ;      /                  4       	       7         )   0    A proposes that X spend 1 BTS and waits for approval from Y.
B proposes that Y approve the proposal from A and waits for approval from X. Alice and Bob each own 40% of the company and Carol owns 20%. An <em>authority</em> is a set of keys and/or accounts, each of which is assigned a weight. Anyone can rotate keys frequently without having to disturb the permissions on the accounts of its users. Background BitShares designs permissions around people rather than cryptography, making it easy to use. Every account can be controlled by
            any weighted combination of other account signatures and private keys. This creates a hierarchical structure that reflects how permissions are
            organized in real life, and makes multi-user control over account authority easier than ever. Multi-user control is the single biggest
            contributor to security, and, when used properly, it can virtually eliminate the risk of theft due to hacking. BitShares introduced a new approach to permissions based upon accounts which are assigned globally unique IDs. Competing blockchain systems suffer from the following shortcomings: Conclusion Consider an example company that is run by 3 individuals: Alice, Bob, and Carol. Coordination and signing must be done completely out-of-band. Credits Cycles Cycles don’t have to be direct as in this case, they can involve arbitrarily long sequences and thus be non-obvious. Dynamic Account Permissions Dynamic hierarchical threshold multi-signature permissions provides people and organizations with a more natural way
to express ownership and control policies. This approach makes the system easier to use, and ultimately more secure than existing solutions. Each <em>authority</em> has a weight threshold that must be crossed before an action requiring that <em>authority</em> may be performed. Equal weighting of M keys is not sufficient to express asymmetric ownership over an account. Every account is assigned <em>two</em> authorities: owner and active. Gathering Signatures If users create an approval cycle in the <em>active authority</em> then the <em>owner authority</em> can be used to break the cycle.
However, if they construct a cycle in the <em>owner authority</em> and the <em>active authority</em> then the accounts involved in the cycle would be locked out. Imagine account X is created that requires A and Y to approve.
Imagine account Y is created that requires B and X to approve.
The graph looks like this: In order to keep things computationally bounded, an individual transaction will only traverse down two layers in a hierarchy.
If more than two layers of hierarchy are present, then an account will have to propose (create one transaction) to
approve a proposal (the other transaction).
When the first proposal (transaction) is approved, permission is then added to the second proposal (transaction). In practice client software can detect cycles and prevent them from being formed. In theory, accounts can form a hierarchy that is arbitrarily deep, and evaluating that hierarchy can take an arbitrary
amount of time. In practice, it is unlikely that a single transaction will have signatures more than 2 levels deep,
which keeps them computation bounded. Anything that requires more than 2 levels is likely to involve many
people, and would not be signed all at once. Instead, it would use the built-in proposed transaction
infrastructure, which tracks partially approved transactions. It is possible for two accounts to require each other to approve a transaction. Keys cannot be changed without coordination of all other parties. Management for the corporate environment Market Cap: Multi-signature technology is all about permission management, and permissions should be defined in terms of people or organizations rather than keys. One of the challenges that has made multi-signature approaches difficult to use in the past was the act of gathering required signatures was
  entirely manual, or required specialized infrastructure. Once a transaction is signed, there is no ability to retract your signature, so the
  last party to sign gains a slight advantage over the other parties. With deeper hierarchies, gathering signatures becomes even more complex. Other account holders broadcast transactions, adding their “Yes” or “No” to the proposal. Owner and Active Keys Price: Scalability Signatures cannot be retracted while waiting on other parties. Solution Someone proposes a transaction and approves it with their account. The <em>active authority</em> is meant to be a hot key and can perform any action except changing the <em>owner authority</em>. The <em>owner authority</em> is designed for cold-storage, and its primary role is to update the <em>active authority</em> or to
change the <em>owner authority</em>. The M-of-N model cannot sufficiently reflect the management hierarchies of many real-life organizations. The Ripple wiki documents a <a href='https://developers.ripple.com/multi-signing.html' target='_blank'>similar Multisign feature</a>, which was discovered independently however was not implemented until more recently. The ability to require multiple digital signatures for sensitive operations on the blockchain is integral to the security of the platform.
While a single secret key may be compromised, multiple keys distributed over multiple locations adds redundant protections, providing a far more secure
experience. The motivating use case is a 2-factor authentication provider as a co-signer on the <em>active authority</em>, but not on the
<em>owner authority</em>. The process for executing a transaction that requires multi-signature authority is as follows: The second solution is to include the partially signed transaction in the consensus state and allow accounts to publish
transactions that add or remove their approval of the transaction.
This simplifies the signing coordination problem, enables people to change their mind before the threshold is reached,
and applies the transaction immediately upon receipt of the final approval. There is no way to resolve this problem with a single approval from any party due to the following reasons: This can be extended logically to propose, and account propose, to approve a transaction. This company requires 2 of the 3 principles to approve all expenses. This process would collect transaction fees as all of the layers in the hierarchy gradually add their permissions, and
at no time requires an unbounded calculation. To simplify this process, a blockchain should manage the signature gathering process by tracking the state of partially
approved proposed transactions.
Under this process, each account can add (or remove) their permission to a transaction atomically, without having to rely
upon an outside system to circulate the transaction.
This becomes especially critical for hierarchies that are arbitrarily deep. Under this approach, each individual pays a single transaction fee each time they approve an action, and every action
involves at most 1 signature verification by the network. This process allows arbitrarily deep hierarchies to be formed without exposing the permission system to vulnerability of
unbounded computation. Under this system, it is possible to define an account that has no keys itself, but instead depends solely upon the
approval of other accounts.
Those other accounts can, in turn, depend upon the approval of other accounts.
This process forms a <em>hierarchy</em> of accounts that must grant permission.
Each account can change its own permissions independently of any accounts above it in the hierarchy, which is what makes
the permissions <em>dynamic</em>. Use Case Volume (24h): When the proposed transaction has the approval of all accounts, it is confirmed. With this approach, a board member can propose that his company approve a transaction. With this approach, a user can remain confident that their account will always be in their control, and yet that control
can be kept in cold storage where no one can hack it. This means that a company account can require the approval of its
board of directors and each board member may in turn require 2 factor authentication. You could define the company in terms of keys assigned to Alice, Bob, and Carol, but what if Alice wants to protect her
own identity with a multi-signature check?
Alice opts to use a service provider that performs 2-factor authentication on every action Alice makes. This protects both Alice and the company, which
does not need to change its permission structure to accommodate the choice of 2-factor authentication. Project-Id-Version: 
POT-Creation-Date: 2019-04-22 12:33+0700
PO-Revision-Date: 2019-04-22 12:59+0700
Last-Translator: 
Language-Team: 
Language: th
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Generator: Poedit 2.2.1
X-Poedit-Basepath: Technology
Plural-Forms: nplurals=1; plural=0;
X-Poedit-SearchPath-0: dynamic-account-permissions-PO.php
 การเสนอที่ให้ X จะจ่าย 1  BTS และรอการอนุมัติจาก Y. 
B เสนอให้  Y อนุมัติรายการจาก A  และรอการอนุมัติจาก X. Alice และ Bob แต่ละคนเป็นเจ้าของ 40% ของ บริษัท และ Carol เป็นเจ้าของ 20%. สิทธิ์ของชุดของคีย์ และ/หรือ บัญชี ซึ่งแต่ละอันมีการกำหนดความสำคัญเอาไว้. ทุกคนสามารถสลับสับเปลี่ยนคีย์ได้บ่อยๆ โดยไม่ต้องรบกวนสิทธิ์การเข้าถึงในบัญชีของผู้ใช้. เบื้องหลัง BitShares ออกแบบสิทธิ์การเข้าถึงบัญชีสำหรับทุกคน มากกว่าแค่การเข้ารหัสป้องกัน, ทำการออกแบบให้ง่ายต่อการใช้ บัญชีทุกบัญชีสามารถควบคุมได้
โดยการวัดความสำคัญร่วมกับบัญชีอื่น ๆ และคีย์ส่วนตัว สิ่งนี้จะสร้างโครงสร้างตามแบบลำดับชั้น ซึ่งสะท้อนถึงการจัดเตรียมสิทธิ์ในชีวิตจริง
 และทำให้ผู้ใช้หลายคนสามารถควบคุมการเงินได้ง่ายขึ้นกว่าที่เคย
การควบคุมผู้ใช้หลายคน เป็นการให้ความสำคัญสูงสุดด้านความปลอดภัย, และเมื่อทำการอย่างถูกต้อง ก็จะสามารถลดความเสี่ยงของการถูกโจรกรรมเนื่องจากการแฮ็กได้. BitShares นำเสนอแนวทางใหม่ ในการให้สิทธิ์การเข้าถึงบัญชีที่มี โดยมอบ IDs ที่จะไม่ซ้ำกันซึ่งมีเพียงชุดเดียวในโลก. การแข่งขันในระบบ blockchain จะได้รับความเสียหายจากข้อบกพร่อง ดังต่อไปนี้: ข้อสรุป ลองพิจารณาตัวอย่าง บริษัท ที่บริหารโดยบุคคล 3 คน ได้แก่ Alice, Bob และ Carol. การประสานงานและการลงนามต้องทำอย่างสมบูรณ์แบบ out-of-band. อ้างอิง วงจร วงจรไม่จำเป็นต้องตรงกับกรณีนี้ ซึ่งสามารถเกี่ยวข้องกับ ลำดับ โดยไม่เจาะจง จึงทำให้ไม่ชัดเจน. สิทธิ์การเข้าถึงบัญชี แบบไดนามิก การอนุญาตให้ใช้ลายเซ็นแบบหลายระดับ แบบไดนามิก นี้ช่วยให้ผู้คนและองค์กร ใกล้เคียงกับโลกความเป็นจริงสะดวก
และง่ายในการแสดงความเป็นเจ้าของ และนโยบายการควบคุม ซึ่งวิธีนี้ทำให้ระบบใช้งานง่ายขึ้น และยังเป็นวิธีที่ปลอดภัยกว่าโซลูชันที่มีอยู่ในปัจจุบัน. แต่ละสิทธิมีระดับความสำคัญที่ต้องผ่านการอนุมัติ ก่อนการดำเนินการที่ต้องใช้สิทธิดังกล่าว. การชั่งน้ำหนักความสำคัญของคีย์ M ไม่เพียงพอที่จะแสดงถึงการเป็นเจ้าของบัญชีนั้นๆ. ทุกบัญชีจะได้สิทธิ์อยู่ทั้งหมด 2 สิทธิ์ คือ สิทธิ์ความเป็นเจ้าของ และ สิทธิ์ในการอนุมัติ. การรวบรวมลายเซ็น หากผู้ใช้สร้างวงจรการอนุมัติในหน่วยงานที่ใช้งานอยู่ สิทธิ์ในการเป็นเจ้าของจะถูกนำมาใช้เพื่อแยกวงจรการทำงานนั้น 
อย่างไรก็ตาม หากพวกเขาสร้างวงจรในอำนาจของเจ้าของ และผู้มีอำนาจที่ใช้งานแล้วบัญชีที่เกี่ยวข้องในวงจรนั้น จะถูกล็อคออก. ลองจินตนาการว่า บัญชี x เป็นผู้สร้าง คำสั่งไปยัง A และ Y ต้องอนุมัติ 
จิตนาการว่า บัญชี Y เป็นผู้สร้างคำสั่งไปยัง B และ x ต้องเป็นผู้อนุมัติ 
กราฟจะออกมาในลักษณะนี้: เพื่อให้สิ่งต่าง ๆ ถูกจำกัดขอบเขต การทำธุรกรรมแต่ละรายการจะทำการสำรวจสองชั้นในลำดับชั้นเท่านั้น 
ถ้าเกินกว่าสองชั้นในลำดับชั้นที่มีอยู่ บัญชีจะต้องเสนอ (สร้างหนึ่งธุรกรรม) เพื่ออนุมัติข้อเสนอ (ธุรกรรมอื่น ๆ ) 
เมื่อข้อเสนอแรก (ธุรกรรม) ได้รับการอนุมัติจะมีการเพิ่มสิทธิ์ในข้อเสนอที่สอง (ธุรกรรม). ในทางปฏิบัติซอฟต์แวร์ไคลเอ็นต์ สามารถตรวจจับวงจร และป้องกันไม่ให้เกิดขึ้น. ในทางทฤษฎี บัญชีสามารถสร้างลำดับชั้นที่ลึกลงไปได้และการประเมินว่าลำดับชั้นสามารถใช้ได้ทุกเวลา ในทางปฏิบัติแล้วนั้น 
เป็นไปได้ยากมากที่ธุรกรรมเดียวจะมีลายเซ็นมากกว่า 2 ระดับ ซึ่งทำให้การคำนวณนั้นมีขอบเขตที่จำกัด 
สิ่งใดก็ตามที่ต้องการมากกว่า 2 ระดับมีแนวโน้มที่จะเกี่ยวข้องกับคนจำนวนมาก และจะไม่ได้รับการลงนามทั้งหมดในครั้งเดียว
โดยมันจะใช้การแสดงธุรกรรมพื้นฐานภายใน ซึ่งติดตามธุรกรรมที่ได้รับการอนุมัติบางส่วน. มีความเป็นไปได้ที่บัญชีสองบัญชีจะต้องอนุมัติธุรกรรมให้ซึ่งกันและกัน. ไม่สามารถเปลี่ยนแปลง key โดยลำพังไม่ต้องประสานงานกับฝ่ายอื่นๆ ทั้งหมด. การบริหารจัดการ สิ่งแวดล้อมขององค์กร มูลค่าตลาด: เทคโนโลยีหลายลายเซ็น นั้นเกี่ยวกับการจัดการสิทธิ์ และควรกำหนดสิทธิ์ในรูปแบบของบุคคลหรือองค์กรมากกว่า key. หนึ่งในการความท้าทายที่ทำให้การทำงานของ multi-signature เป็นวิธีการทำงานที่เกิดขึ้นได้ยากในอดีต การรวบรวมลายเซ็นจึงต้องทำกันแบบแมนนวล หรือโครงสร้างพื้นฐานที่จำเป็น เมื่อมีการเซ็นธุรกรรม ไม่สามารถที่จะลบหรือถอนลายเซ็นที่ทำธุรกรรมได้ ดังนั้นฝ่ายสุดท้ายที่จะลงนามธุรกรรมจะได้รับประโยชน์เล็กน้อยจากทุกฝ่าย เมื่อมีลำดับชั้นที่ลึกลงไปจะทำให้รวบรวมลายเซ็นได้ยากยิ่งขึ้น. ผู้ถือบัญชี ที่ออกประกาศรายการ สามารถเพิ่มตัวเลือก “ใช่” หรือ “ไม่” ในข้อเสนอได้. ความเป็นเจ้าของ และ Active Keys ราคา: ความยืดหยุ่น ไม่สามารถถอนยกเลิกลายเซ็น ในขณะที่รอให้ฝ่ายอื่นๆ ตรวจสอบ. การแก้ปัญหา มีคนเสนอธุรกรรมและอนุมัติบัญชีดังกล่าวด้วยบัญชีของตน. สิทธิ์ในการอนุมัติ หมายถึง hot key และสามารถที่จะดำเนินการใด ๆ ได้ยกเว้นการเปลี่ยนแปลงสิทธิ์ความเป็นเจ้าของ. สิทธิ์ความเป็นเจ้าของ ได้รับการออกแบบมาสำหรับ cold-storage และบทบาทหลัก คือ การอัปเดต 
อนุมัติสิทธิ์ใช้งาน หรือ เปลี่ยนสิทธิ์ความเป็นเจ้าของ. โมเดล M-of-N ไม่สามารถสะท้อนถึงการจัดการลำดับชั้นภายในองค์กรเหมือนในชีวิตจริง. เอกสารจาก  Ripple wiki แต่ยังไม่ได้ดำเนินการ <a href=‘https://developers.ripple.com/multi-signing.html' target=‘_blank’>ข้อเสนอสำหรับคุณสมบัติ Multisign</a> ที่คล้ายคลึงกัน ที่ถูกค้นพบ. ความสามารถในการกำหนดลายเซ็นดิจิทัลที่หลากหลายแบบ เพื่อการตรวจสอบที่ละเอียดอ่อนบน blockchain เป็นส่วนสำคัญต่อความปลอดภัยของแพลตฟอร์ม 
ขณะที่ single key อาจมีโอกาสถูกบุกรุก, แต่ multiple keys ที่กระจายไปทั่ว blockchain 
ช่วยเพิ่มความคุ้มครองที่ซ้ำซ้อนยากต่อการบุกรุก ซึ่งส่งผลให้เกิดความปลอดภัยยิ่งขึ้น. กรณีใช้ในการชักจูง แบบ 2-factor authentication ผู้ให้บริการ เป็น ผู้ลงนามร่วมใน สิทธิ์ในการอนุมัติ แต่ไม่ได้อยู่ใน สิทธิ์ความเป็นเจ้าของ. กระบวนการสำหรับ การทำธุรกรรมที่ต้องใช้สิทธิ์จาก multi-signature มีดังนี้: ทางออกที่สอง คือ การรวมธุรกรรมบางส่วนลงนามในสถานะที่เป็นเอกฉันท์ และอนุญาตให้บัญชีเผยแพร่ธุรกรรม
 ที่เพิ่มหรือลบการอนุมัติธุรกรรมดังกล่าว ทางออกนี้ช่วยลดปัญหาการลงนาม, 
ช่วยให้สามารถเปลี่ยนใจเปลี่ยนความคิดก่อนถึงเวลาที่กำหนดได้, 
และใช้บันทึกรายการทันทีที่ได้รับการอนุมัติขั้นสุดท้าย. ไม่มีวิธีแก้ไขปัญหานี้ด้วยการอนุมัติเพียงครั้งเดียวจากฝ่ายใดฝ่ายหนึ่งเนื่องจากเหตุผลดังต่อไปนี้: สิ่งนี้สามารถขยายเหตุผลเพื่อเสนอขออนุมัติ และเสนออนุมัติบัญชี เพื่ออนุมัติการทำธุรกรรม. บริษัท นี้ต้องการ 2 ใน 3 หลักการในการอนุมัติค่าใช้จ่ายทั้งหมด. กระบวนการนี้จะเก็บค่าธรรมเนียมการทำธุรกรรม เนื่องจากเลเยอร์ทั้งหมดในลำดับชั้นค่อยๆ เพิ่มสิทธิ์ของพวกเขา
และในเวลาที่ไม่จำเป็นต้องมีการคำนวณมากนัก. เพื่อทำให้กระบวนการนี้ง่ายยิ่งขึ้น blockchain ได้เลือกการจัดการบริหารลายเซ็นโดย การติดตามสถานะของธุรกรรมที่เสนอบางส่วนที่ได้รับอนุมัติ
 ภายใต้กรรมวิธีนี้ แต่ละบัญชีสามารถ เพิ่ม หรือ ลบ ย้าย สิทธิต่างๆ ไปยังธุรกรรมได้โดยอัตโนมัติ 
โดยไม่ต้องพึ่งพาระบบภายนอกเพื่อหมุนเวียนธุรกรรม 
นี่เป็นสิ่งสำคัญอย่างยิ่งสำหรับลำดับชั้นที่มีความลึกและซับซ้อนยิ่งขึ้น. ภายใต้วิธีนี้ แต่ละคนจ่ายค่าธรรมเนียมการทำธุรกรรมครั้งเดียวทุกครั้งที่พวกเขาอนุมัติการกระทำ 
และทุกการกระทำเกี่ยวข้องกับการตรวจสอบลายเซ็นสูงสุด 1 ครั้งโดยเครือข่าย กระบวนการนี้อนุญาตให้มีการจัด ลำดับชั้นแบบลึก 
ได้เลยโดยไม่ต้องการประกาศอนุญาตจากระบบจัดการสิทธิ ตัดความเสี่ยงของการคำนวณไป. ภายใต้ระบบนี้คุณสามารถกำหนดบัญชีที่ไม่มีคีย์เองได้ แต่ยังขึ้นอยู่กับการอนุมัติจากบัญชีอื่นๆ 
ในทางกลับกันบัญชีอื่นๆ
 จะขึ้นอยู่กับการอนุมัติบัญชีถนัดไปเช่นกัน กระบวนการนี้สร้างลำดับชั้นของบัญชีที่ต้องตรวจสอบซึ่งกันและกันในการอนุมัติ
 แต่ละบัญชีสามารถเปลี่ยนสิทธิ์ของตนเองได้โดยอิสระจากบัญชีใดๆ ที่อยู่ในลำดับบนจากบัญชีตน ซึ่งเป็นสิ่งที่สามารถทำได้ 
ในการเข้าถึงแบบ ไดนามิก. กรณีต่างๆ ที่เกิดขึ้นภายในระบบ ปริมาณ (24ชม.): เมื่อรายการได้รับการอนุมัติจากบัญชีทั้งหมดแล้ว จึงจะได้รับการยืนยัน. ด้วยวิธีการนี้สมาชิกคณะกรรมการ สามารถเสนอให้บริษัทของเขา อนุมัติการทำธุรกรรม. ด้วยวิธีนี้ผู้ใช้สามารถมั่นใจได้ว่าบัญชีของตน จะอยู่ในการควบคุมเสมอ และยังถูกเก็บไว้ใน cold storage 
ซึ่งไม่มีใครสามารถแฮ็กได้ ซึ่งหมายความว่าบัญชีบริษัท จะต้องได้รับการอนุมัติจากคณะกรรมการบริษัททั้งหมด 
และสมาชิกในคณะกรรมการบริษัทแต่ละราย จะต้องได้รับการการตรวจสอบ แบบ 2 factor authentication. คุณสามารถกำหนด บริษัท ในแง่ของกุญแจที่กำหนดให้กับ Alice, Bob และ Carol แต่ถ้าหาก Alice ต้องการปกป้องเธอ
ตัวตนของคุณเอง ด้วยการตรวจสอบ multi-signature?
Alice เลือกที่จะใช้ผู้ให้บริการที่ดำเนินการตรวจสอบสิทธิ์แบบ 2 ปัจจัยในทุกการกระทำของAlice สิ่งนี้ปกป้องทั้งAlice และบริษัท
ซึ่งไม่จำเป็นต้องเปลี่ยนโครงสร้างการอนุญาต เพื่อรองรับตัวเลือกการตรวจสอบสิทธิ์แบบ 2 ปัจจัย. 