local UserClass;
local QuestNum;
local Ret = 0;
-------------------
--�̽���Ʈ����
-------------------
if EVENT == 222  then
	QuestNum = SearchQuest(UID, 24412);
		if QuestNum == 0 then --�ش� NPC���� �Ҽ� �ִ� ����Ʈ�� 0�� �϶� 
          -- SelectMsg(UID, 2. -1...........)
			 SelectMsg(UID, 2, -1, 1273, 24412, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
			 --SetQuestStep(UID, EVENT, 1); -- �� �ϴ� �ɱ�?
			 Ret = 1; -- �̰� �� ���� ���ѿ�? �׳� RETURN�� �ȵǳ���?
		elseif QuestNum > 1 and  QuestNum < 100 then--�ش� NPC���� �Ҽ� �ִ� ����Ʈ�� 1�� �϶� 
          NpcMsg(UID, 1274, 24412)
      else --�ش� NPC���� �Ҽ� �ִ� ����Ʈ�� 1�� �̻� �϶� 
          EVENT = QuestNum
		end
end


local ITEM_COUNT1=0;
local RUN_EXCHANGE ;--��� ��ü �Լ� ����� �ּ��� 


if EVENT == 224 then
   ITEM_COUNT1 = HowmuchItem(UID, 910087000); --exchange ���̺� �ε�����   
   if  ITEM_COUNT1 <= 0 then -- ��� ������
      SelectMsg(UID, 2, 67, 1278, 24412, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      elseif ITEM_COUNT1  > 0 then-- ��� ������
          SelectMsg(UID, 4, 67, 1283, 24412, 41, 226, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
  end
end


local Check;

if EVENT == 226 then
  Check = CheckExchange(UID, 93)
   if  Check ==1 then
   RunExchange(UID, 93);
   SaveEvent(UID, 614); 
   else
  Ret = 1;	
  end	 
end
return Ret;