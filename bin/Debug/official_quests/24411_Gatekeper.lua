local UserClass;
local QuestNum;
local Ret = 0;
-------------------
--�糪����Ʈ ���
-------------------
if EVENT == 217  then
	QuestNum = SearchQuest(UID, 24411);
		if QuestNum == 0 then --�ش� NPC���� �Ҽ� �ִ� ����Ʈ�� 0�� �϶� 
          -- SelectMsg(UID, 2. -1...........)
			 SelectMsg(UID, 2, -1, 1279, 24411, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
			 --SetQuestStep(UID, EVENT, 1); -- �� �ϴ� �ɱ�?
			 Ret = 1; -- �̰� �� ���� ���ѿ�? �׳� RETURN�� �ȵǳ���?
		elseif QuestNum > 1 and  QuestNum < 100 then--�ش� NPC���� �Ҽ� �ִ� ����Ʈ�� 1�� �϶� 
          NpcMsg(UID, 1279, 24411)
      else --�ش� NPC���� �Ҽ� �ִ� ����Ʈ�� 1�� �̻� �϶� 
          EVENT = QuestNum
		end
end

local ITEM_COUNT1=0;
local RUN_EXCHANGE ;--��� ��ü �Լ� ����� �ּ��� 

if EVENT == 218 then
   ITEM_COUNT1 = HowmuchItem(UID, 910086000); --exchange ���̺� �ε�����   
   if  ITEM_COUNT1 <= 0 then -- ��� ������
      SelectMsg(UID, 2, 66, 1269, 24411, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      elseif ITEM_COUNT1  > 0 then-- ��� ������
          SelectMsg(UID, 2, 66, 1270, 24411, 58, 221, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
           
   end
end

if EVENT == 221 then
  Check = CheckExchange(UID, 92)
   if  Check ==1 then
   RunExchange(UID, 92);
   SaveEvent(UID, 611); 
   SaveEvent(UID, 21); 
   else
  Ret = 1;	
  end	 
end

return Ret;