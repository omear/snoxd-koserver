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
local NPC = 26055;
local savenum = 420;

if EVENT == 100 then
ItemA = HowmuchItem(UID, 910054000);  -- 4��° ���� 
    if  ItemA == 0 then -- 3��° ����  ������
    SelectMsg(UID, 2, savenum, 4416, NPC, 10, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else-- 4��° ���� ������ 
    SelectMsg(UID, 4, savenum, 4417, NPC, 22, 101, 23, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 101 then
    SelectMsg(UID, 2, savenum, 4418, NPC, 4182, 102, 4183, 103, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end


if EVENT == 102 then
   ChangePosition(UID)
   RunExchange(UID, 475);
   SaveEvent(UID, 4226);   
end

if EVENT == 103 then
    ChangePosition(UID)
    RobItem(UID, 910054000, 1);
    SelectMsg(UID, 2, savenum, 4419, NPC, 10, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end
