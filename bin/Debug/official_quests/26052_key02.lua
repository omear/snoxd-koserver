--������ ������
-- �׳� �ݱ� 168

-- EVENT �� 100�� �̻� ���� ���

-- UID : �������� �����ϴ� ������ȣ
-- EVENT : �������� �����ϴ� ����Ʈ ��ȣ
-- STEP : �������� �����ϴ� ����Ʈ ���� �ܰ�

-- ���� ������ �Ķ��Ÿ�� ��� ����� �׻� ���������� �����

-- �������� ����...
local UserClass;
local QuestNum;
local Ret = 0;


if EVENT == 168 then
	Ret = 1;
end

-- ������ ������ Ŭ���� ����Ʈ üũ  

local ItemA;
local NPC = 26052;
local savenum = 417;

if EVENT == 100 then
ItemA = HowmuchItem(UID, 910051000);  -- 1��° ���� 
    if  ItemA == 0 then -- 1��° ����  ������
    SelectMsg(UID, 2, savenum, 4404, NPC, 10, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else-- 1��° ���� ������ 
    SelectMsg(UID, 4, savenum, 4405, NPC, 22, 101, 23, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 101 then
    SelectMsg(UID, 2, savenum, 4406, NPC, 4176, 102, 4177, 103, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end


if EVENT == 102 then
   ChangePosition(UID)
   RunExchange(UID, 472);
   SaveEvent(UID, 4223);   
end

if EVENT == 103 then
    ChangePosition(UID)
    RobItem(UID, 910051000, 1);
    SelectMsg(UID, 2, savenum, 4407, NPC, 10, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end
