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
local NPC = 26057;
local savenum = 422;

if EVENT == 100 then
ItemA = HowmuchItem(UID, 910056000);  -- 6��° ���� 
    if  ItemA == 0 then -- 6��° ����  ������
    SelectMsg(UID, 2, savenum, 4424, NPC, 10, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else-- 6��° ���� ������ 
    SelectMsg(UID, 4, savenum, 4425, NPC, 22, 101, 23, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 101 then
    SelectMsg(UID, 2, savenum, 4426, NPC, 4186, 102, 4187, 103, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end


if EVENT == 103 then
   ChangePosition(UID)
   RunExchange(UID, 477);
   SaveEvent(UID, 4228);   
end

if EVENT == 102 then
    ChangePosition(UID)
    RobItem(UID, 910056000, 1);
    SelectMsg(UID, 2, savenum, 4427, NPC, 10, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end
