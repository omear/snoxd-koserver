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
local NPC = 16056;
local savenum = 421;

if EVENT == 100 then
ItemA = HowmuchItem(UID, 910055000);  -- 5��° ���� 
    if  ItemA == 0 then -- 5��° ����  ������
    SelectMsg(UID, 2, savenum, 4320, NPC, 10, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else-- 5��° ���� ������ 
    SelectMsg(UID, 4, savenum, 4321, NPC, 22, 101, 23, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 101 then
    SelectMsg(UID, 2, savenum, 4322, NPC, 4184, 102, 4185, 103, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end


if EVENT == 103 then
   ChangePosition(UID)
   RunExchange(UID, 476);
   SaveEvent(UID, 4241);   
end

if EVENT == 102 then
    ChangePosition(UID)
    RobItem(UID, 910055000, 1);
    SelectMsg(UID, 2, savenum, 4323, NPC, 10, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end
