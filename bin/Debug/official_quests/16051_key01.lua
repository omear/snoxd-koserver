--������ �ļ���
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

-- ������ �ļ��� Ŭ���� ����Ʈ üũ  

local ItemA;
local NPC = 16051;
local savenum = 416;

if EVENT == 100 then
ItemA = HowmuchItem(UID, 910050000);  -- ��ɼ� 
    if  ItemA == 0 then -- ��ɼ� ������
    SelectMsg(UID, 2, savenum, 4300, NPC, 10, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else-- ��ɼ� ������ 
    SelectMsg(UID, 4, savenum, 4301, NPC, 22, 101, 23, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 101 then
    SelectMsg(UID, 2, savenum, 4302, NPC, 4174, 102, 4175, 103, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end


if EVENT == 102 then
   ChangePosition(UID)
   RunExchange(UID, 471);		 
   SaveEvent(UID,4236);
end

if EVENT == 103 then
    ChangePosition(UID)
    RobItem(UID, 910050000, 1);
    SelectMsg(UID, 2, savenum, 4303, NPC, 10, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end
