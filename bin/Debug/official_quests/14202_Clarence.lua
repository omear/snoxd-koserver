
-- [Ŭ�󷻽�]

-- EVENT �� 100�� �̻� ���� ����϶�

-- UID : �������� �����ϴ� ������ȣ
-- EVENT : �������� �����ϴ� ����Ʈ ��ȣ
-- STEP : �������� �����ϴ� ����Ʈ ���� �ܰ�

-- ���� ������ �Ķ��Ÿ�� ��� ����� �׻� ���������� ����?

-- �������� ����...
local UserClass;
local QuestNum;
local Ret = 0;

-- [Ŭ�󷻽�][����] Ŭ���� ����Ʈ üũ  

if EVENT == 190 then
	QuestNum = SearchQuest(UID, 14202);
		if QuestNum == 0 then --�ش� NPC���� �Ҽ� �ִ� ����Ʈ�� 0�� �϶� 
          -- SelectMsg(UID, 2. -1...........)
			 SelectMsg(UID, 2, -1, 3825, 14202, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
			 --SetQuestStep(UID, EVENT, 1); -- �� �ϴ� �ɱ�?
			 Ret = 1; -- �̰� �� ���� ���ѿ�? �׳� RETURN�� �ȵǳ���?
		elseif QuestNum > 1 and  QuestNum < 100 then--�ش� NPC���� �Ҽ� �ִ� ����Ʈ�� 1�� �϶� 
          NpcMsg(UID, 3825,14202)
      else --�ش� NPC���� �Ҽ� �ִ� ����Ʈ�� 1�� �̻� �϶� 
          EVENT = QuestNum
		end
end

if EVENT == 193 then
    Ret = 1;
end


--�������� ����Ʈ

if EVENT == 220 then -- ����
   SelectMsg(UID, 1, 313, 3114, 14202, 3013, 231, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 231 then
   SelectMsg(UID, 1, 313, 3115, 14202, 3003, 221, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 221 then
   ShowMap(UID, 306);
   SaveEvent(UID, 3202);
end

if EVENT == 222 then -- ī��
   SelectMsg(UID, 1, 313, 3112, 14202, 3013, 232, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 232 then
   SelectMsg(UID, 1, 313, 3113, 14202, 3003, 233, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 233 then
   ShowMap(UID, 307);
   SaveEvent(UID, 3202);
end

-- �������� 313���� �Ӽ� 0�� 4���� ���

if EVENT == 223 then
   SelectMsg(UID, 2, 313, 3088, 14202, 3000, 224, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 224 then
   SelectMsg(UID, 4, 313, 3089, 14202, 22, 225, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 225 then
   SaveEvent(UID, 3203);
end

-- ��Ḧ �� ����� �� 
local NATION = 0;--���� üũ

if EVENT == 226 then
   SaveEvent(UID, 3205);
   NATION = CheckNation(UID);
   if NATION == 1 then -- ī�罺 �϶�
      SelectMsg(UID, 1, 313, 3093, 14202, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- �����϶�
      SelectMsg(UID, 1, 313, 3094, 14202, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

local ITEM_COUNTA=0;
local ITEM_COUNTB=0;
local ITEM_COUNTC=0;
local RUN_EXCHANGE ;--��� ��ü �Լ� ����� �ּ��� 

if EVENT == 228 then
   ITEM_COUNTA = HowmuchItem(UID, 330310014);
   ITEM_COUNTB = HowmuchItem(UID, 389075000);
   ITEM_COUNTC = HowmuchItem(UID, 900000000);
   if ITEM_COUNTA  > 0 and ITEM_COUNTB  > 29 and ITEM_COUNTC  > 4999999 then-- ��� ��������
      SelectMsg(UID, 4, 313, 3095, 14202, 10, 230, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- ��ᰡ ������
      if  ITEM_COUNTA <= 0 then -- A��� ������
        SelectMsg(UID, 2, 313, 3092, 14202, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      elseif  ITEM_COUNTB <= 29 then -- B��� ������
        SelectMsg(UID, 2, 313, 3092, 14202, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      else -- C��� ������
     SelectMsg(UID, 2, 313, 3092, 14202, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      end   
   end
end

if EVENT == 229 then
   ShowMap(UID, 7);
end

local Check;

if EVENT == 230 then
   Check = CheckExchange(UID, 313)
   if  Check ==1 then
   RunExchange(UID, 313);
   SaveEvent(UID, 3206);
   else
  Ret = 1;	
  end	 
end


--�ӵ��Ǻ�� ����Ʈ
--local SHOW_MAP; -- ���� �����ִ� �Լ� ����� �ּ���

if EVENT == 300 then
   SelectMsg(UID, 1, 314, 3001, 14202, 28, 301, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 301 then
   ShowMap(UID, 5);
   SaveEvent(UID, 3222);
end

if EVENT == 302 then
   SelectMsg(UID, 1, 314, 3002, 14202, 28, 301, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

--�ӵ��Ǻ�� 311���� �Ӽ� 0�� 4���� ���

if EVENT == 303 then
   SelectMsg(UID, 2, 314, 3096, 14202, 3011, 304, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 304 then
   SelectMsg(UID, 4, 314, 3097, 14202, 22, 305, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 305 then
   SaveEvent(UID, 3223);
end

-- ��Ḧ �� ����� �� 
local NATION = 0;--���� üũ

if EVENT == 306 then
   SaveEvent(UID, 3225);
   NATION = CheckNation(UID);
   if NATION == 1 then -- ī�罺 �϶�
      SelectMsg(UID, 1, 314, 3101, 14202, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- �����϶�
      SelectMsg(UID, 1, 314, 3102, 14202, 21, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

local ITEM_COUNTA=0;
local ITEM_COUNTB=0;
local ITEM_COUNTC=0;
local RUN_EXCHANGE ;--��� ��ü �Լ� ����� �ּ��� 

if EVENT == 308 then
   ITEM_COUNTA = HowmuchItem(UID, 379113000);
   ITEM_COUNTB = HowmuchItem(UID, 379201000);
   ITEM_COUNTC = HowmuchItem(UID, 379014000);
   if  ITEM_COUNTA  > 4 and  ITEM_COUNTB  > 49 and  ITEM_COUNTC  > 29 then --��ᰡ �������� 
      SelectMsg(UID, 4, 314, 3103, 14202, 10, 310, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- ��ᰡ ������
      if ITEM_COUNTA <= 4 then -- A ��� ������
        SelectMsg(UID, 2, 314, 3100, 14202, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      elseif  ITEM_COUNTB <= 49 then -- B ��� ������ 
        SelectMsg(UID, 2, 314, 3100, 14202, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      else -- C ��� ������
      SelectMsg(UID, 2, 314, 3100, 14202, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      end
    end
end

if EVENT == 309 then
   ShowMap(UID, 7);
end

local Check;

if EVENT == 310 then
   Check = CheckExchange(UID, 400)
   if  Check ==1 then
   RunExchange(UID, 314);
   SaveEvent(UID, 3226);
   else
  Ret = 1;	
  end	 
end

--��ø������ ����Ʈ
--local SHOW_MAP; -- ���� �����ִ� �Լ� ����� �ּ���

if EVENT == 400 then
   SelectMsg(UID, 1, 315, 3001, 14202, 28, 401, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 401 then
   ShowMap(UID, 5);
   SaveEvent(UID, 3242);
end

if EVENT == 402 then
   SelectMsg(UID, 1, 315, 3002, 14202, 28, 401, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

--��ø������ 315���� �Ӽ� 0�� 4���� ���

if EVENT == 403 then
   SelectMsg(UID, 2, 315, 3104, 14202, 10, 404, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 404 then
   SelectMsg(UID, 4, 315, 3105, 14202, 22, 405, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 405 then
   SaveEvent(UID, 3243);
end

-- ��Ḧ �� ����� �� 
local NATION = 0;--���� üũ

if EVENT == 406 then
   SaveEvent(UID, 3245);
   NATION = CheckNation(UID);
   if NATION == 1 then -- ī�罺 �϶�
      SelectMsg(UID, 1, 315, 3109, 14202, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- �����϶�
      SelectMsg(UID, 1, 315, 3110, 14202, 21, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

local ITEM_COUNTA=0;
local ITEM_COUNTB=0;
local ITEM_COUNTC=0;
local RUN_EXCHANGE ;--��� ��ü �Լ� ����� �ּ��� 

if EVENT == 408 then
   ITEM_COUNTA = HowmuchItem(UID, 379045000);
   ITEM_COUNTB = HowmuchItem(UID, 379042000);
   ITEM_COUNTC = HowmuchItem(UID, 379067000);
   if  ITEM_COUNTA  > 19 and  ITEM_COUNTB  > 0 and  ITEM_COUNTC  > 0 then --��ᰡ �������� 
      SelectMsg(UID, 4, 315, 3111, 14202, 10, 410, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- ��ᰡ ������
      if ITEM_COUNTA <= 19 then -- A ��� ������
        SelectMsg(UID, 2, 315, 3108, 14202, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      elseif  ITEM_COUNTB <= 0 then -- B ��� ������ 
        SelectMsg(UID, 2, 315, 3108, 14202, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      else -- C ��� ������
        SelectMsg(UID, 2, 315, 3108, 14202, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      end
    end
end

if EVENT == 409 then
   ShowMap(UID, 7);
end

local Check;

if EVENT == 410 then
   Check = CheckExchange(UID, 315)
   if  Check ==1 then
   RunExchange(UID, 315);
   SaveEvent(UID, 3246);
   else
  Ret = 1;	
  end	 
end

--���Ǽ��� ����Ʈ
--local SHOW_MAP; -- ���� �����ִ� �Լ� ����� �ּ���

if EVENT == 500 then
   SelectMsg(UID, 1, 316, 3112, 14202, 28, 1000, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 1000 then
   SelectMsg(UID, 1, 316, 3113, 14202, 28, 501, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 501 then
   ShowMap(UID, 306);
   SaveEvent(UID, 3262);
end

if EVENT == 502 then
   SelectMsg(UID, 1, 316, 3114, 14202, 28, 1001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 1001 then
   SelectMsg(UID, 1, 316, 3115, 14202, 28, 501, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

--���Ǽ��� 316���� �Ӽ� 0�� 4���� ���

if EVENT == 503 then
   SelectMsg(UID, 2, 316, 3116, 14202, 10, 504, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 504 then
   SelectMsg(UID, 4, 316, 3117, 14202, 22, 505, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 505 then
   SaveEvent(UID, 3263);
end

-- ��Ḧ �� ����� �� 
local NATION = 0;--���� üũ

if EVENT == 506 then
   SaveEvent(UID, 3265);
   NATION = CheckNation(UID);
   if NATION == 1 then -- ī�罺 �϶�
      SelectMsg(UID, 1, 316, 3121, 14202, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- �����϶�
      SelectMsg(UID, 1, 316, 3122, 14202, 21, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

local ITEM_COUNTA=0;
local ITEM_COUNTB=0;
local ITEM_COUNTC=0;
local ITEM_COUNTD=0;
local RUN_EXCHANGE ;--��� ��ü �Լ� ����� �ּ��� 

if EVENT == 508 then
   ITEM_COUNTA = HowmuchItem(UID, 379040000);
   ITEM_COUNTB = HowmuchItem(UID, 379041000);
   ITEM_COUNTC = HowmuchItem(UID, 379042000);
   ITEM_COUNTD = HowmuchItem(UID, 379014000);
   if  ITEM_COUNTA  > 0 and  ITEM_COUNTB  > 0 and  ITEM_COUNTC  > 0 and  ITEM_COUNTD  > 9 then --��ᰡ �������� 
      SelectMsg(UID, 4, 316, 3123, 14202, 10, 510, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- ��ᰡ ������
      if ITEM_COUNTA <= 0 then -- A ��� ������
        SelectMsg(UID, 2, 316, 3120, 14202, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      elseif  ITEM_COUNTB <= 0 then -- B ��� ������ 
        SelectMsg(UID, 2, 316, 3120, 14202, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      elseif  ITEM_COUNTB <= 0 then -- C ��� ������ 
        SelectMsg(UID, 2, 316, 3120, 14202, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      else -- D ��� ������
        SelectMsg(UID, 2, 316, 3120, 14202, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      end
    end
end

if EVENT == 509 then
   ShowMap(UID, 7);
end

local Check;

if EVENT == 510 then
   Check = CheckExchange(UID, 316)
   if  Check ==1 then
   RunExchange(UID, 316);
   SaveEvent(UID, 3266);
   else
  Ret = 1;	
  end	 
end

--�ƽ������� ����Ʈ
--local SHOW_MAP; -- ���� �����ִ� �Լ� ����� �ּ���

if EVENT == 600 then
   SelectMsg(UID, 1, 317, 3001, 14202, 28, 601, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 601 then
   ShowMap(UID, 5);
   SaveEvent(UID, 3282);
end

if EVENT == 602 then
   SelectMsg(UID, 1, 317, 3002, 14202, 28, 601, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

--�ƽ������� 317���� �Ӽ� 0�� 4���� ���

if EVENT == 603 then
   SelectMsg(UID, 2, 317, 3124, 14202, 10, 604, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 604 then
   SelectMsg(UID, 4, 317, 3125, 14202, 22, 605, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 605 then
   SaveEvent(UID, 3283);
end

-- ��Ḧ �� ����� �� 
local NATION = 0;--���� üũ

if EVENT == 606 then
   SaveEvent(UID, 3285);
   NATION = CheckNation(UID);
   if NATION == 1 then -- ī�罺 �϶�
      SelectMsg(UID, 1, 317, 3005, 14202, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- �����϶�
      SelectMsg(UID, 1, 317, 3129, 14202, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

local ITEM_COUNT=0;
local RUN_EXCHANGE ;--��� ��ü �Լ� ����� �ּ��� 
local NATION = 0;--���� üũ

if EVENT == 608 then
	ITEM_COUNT = GetMaxExchange(UID, 317); --exchange ���̺� �ε����� 
      if  ITEM_COUNT == 0 then -- ��� ������
       SelectMsg(UID, 2, 317, 3128, 14202, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
       else-- ��� ������
       SelectMsg(UID, 4, 317, 3130, 14202, 10, 610, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      end
end

if EVENT == 609 then
   ShowMap(UID, 314);
end

local Check;

if EVENT == 610 then
   Check = CheckExchange(UID, 317)
   if  Check ==1 then
   min_count = GetMaxExchange(UID, 317);
 	RunCountExchange(UID, 317, min_count);	
   SaveEvent(UID, 3286);
   else
  Ret = 1;	
  end	 
end

--ī��κ��� ����Ʈ
--local SHOW_MAP; -- ���� �����ִ� �Լ� ����� �ּ���

if EVENT == 700 then
   SelectMsg(UID, 1, 318, 3001, 14202, 28, 701, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 701 then
   ShowMap(UID, 5);
   SaveEvent(UID, 3292);
end

if EVENT == 702 then
   SelectMsg(UID, 1, 318, 3002, 14202, 28, 701, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

--ī��κ��� 318���� �Ӽ� 0�� 4���� ���

if EVENT == 703 then
   SelectMsg(UID, 2, 318, 3131, 14202, 10, 704, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 704 then
   SelectMsg(UID, 4, 318, 3132, 14202, 22, 705, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 705 then
   SaveEvent(UID, 3293);
end

-- ��Ḧ �� ����� �� 
local NATION = 0;--���� üũ

if EVENT == 706 then
   SaveEvent(UID, 3295);
   NATION = CheckNation(UID);
   if NATION == 1 then -- ī�罺 �϶�
      SelectMsg(UID, 1, 318, 3136, 14202, 3015, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- �����϶�
      SelectMsg(UID, 1, 318, 3006, 14202, 3015, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

local ITEM_COUNT=0;
local RUN_EXCHANGE ;--��� ��ü �Լ� ����� �ּ��� 

if EVENT == 708 then
	ITEM_COUNT = GetMaxExchange(UID, 318); --exchange ���̺� �ε����� 
      if  ITEM_COUNT == 0 then -- ��� ������
       SelectMsg(UID, 2, 318, 3135, 14202, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
       else-- ��� ������
       SelectMsg(UID, 4, 318, 3137, 14202, 10, 710, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      end
end

if EVENT == 709 then
   ShowMap(UID, 314);
end

local Check;

if EVENT == 710 then
   Check = CheckExchange(UID, 400)
   if  Check ==1 then
   min_count = GetMaxExchange(UID, 318);
 	RunCountExchange(UID, 318, min_count);	
   SaveEvent(UID, 3296);
   else
  Ret = 1;	
  end	 
end

--******************************************************--
-- 2�� ���� ���� 
--******************************************************--

local NPC = 14202;
local savenum = 408;

-- �õ�̼� ����

if EVENT == 530 then
   Class = CheckClass (UID);
   if Class == 7 then -- 2������ ������ ���
   SaveEvent(UID, 4099); --helper ��ȣ ���� 
   NATION = CheckNation(UID);
      if NATION == 1 then --ī�罺 �϶� 
      SelectMsg(UID, 1, savenum, 4094, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      else -- �����϶�
      SelectMsg(UID, 1, savenum, 4095, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      end
   else -- 2�� ������ �ǰų�, 1�� ������ ���� ���
    Ret = 1;
   end
end

-- Ŭ�󷻽� 408���� �Ӽ� 0�� 4���� ���

if EVENT == 532 then   
Level = CheckLevel(UID)
   if Level > 59 then -- ������ 60�̻��ΰ�?   
   Class = CheckClass (UID);
      if Class == 5 or Class == 7 or Class == 9 or Class == 11 then -- 1�� ���� ���ΰ� üũ
       SelectMsg(UID, 4, savenum, 4098, NPC, 22, 533, 23, 534, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      else --1�� ������ �̹� ������
      SaveEvent(UID, 4101);
      SelectMsg(UID, 2, savenum, 4097, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      end
   else --������ 60�����϶� 
   SelectMsg(UID, 2, savenum, 4096, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 533 then
   SaveEvent(UID, 4100); --������
end

if EVENT == 534 then
   SaveEvent(UID, 4103); -- ������ 
end

-- ��Ḧ �� ����� �� 
local NATION = 0;--���� üũ

if EVENT == 535 then
   SaveEvent(UID, 4102);
   NATION = CheckNation(UID);
   if NATION == 1 then -- ī�罺 �϶�
      SelectMsg(UID, 1, savenum, 4101, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- �����϶�
      SelectMsg(UID, 1, savenum, 4102, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

-- Ŭ�󷻽� 408���� �Ӽ� 1�� 3���� ���

if EVENT == 536 then
   ITEM_COUNTA = HowmuchItem(UID, 379241000); --���� ����
   ITEM_COUNTB = HowmuchItem(UID, 379236000); -- ������ ��������
    if  ITEM_COUNTA  > 0 and  ITEM_COUNTB  > 0  then --��ᰡ �������� 
      SelectMsg(UID, 2, savenum, 4103, NPC, 4062, 537, 4063, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- ��ᰡ ������
       if ITEM_COUNTA <= 0 then -- A ��� ������
       SelectMsg(UID, 2, savenum, 4099, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
       else -- B ��� ������ 
       SelectMsg(UID, 2, savenum, 4100, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
       end
   end
end

if EVENT == 537 then
   SaveEvent(UID, 4101);
   RobItem(UID, 379241000, 1);
   RobItem(UID, 379236000, 1);
   PromoteUser(UID)
   NATION = CheckNation(UID);
   if NATION == 1 then --ī�罺 �϶� 
   SelectMsg(UID, 1, savenum, 4092, NPC, 4064, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- �����϶�
   SelectMsg(UID, 1, savenum, 4093, NPC, 4064, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

--******************************************************--
-- 2�� ���� �� 
--******************************************************--
--******************************************************--
-- 70Lv skill - start
--******************************************************--

--seed or misel call

if EVENT == 820 then
   SelectMsg(UID, 1, 52, 3225, 14202, 3006, 821, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 821 then
   ShowMap(UID, 306);
   SaveEvent(UID, 3422);
end

if EVENT == 822 then
   SelectMsg(UID, 1, 52, 3224, 14202, 3006, 821, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

-- 70Lv skill no.52 type 0 or 4

if EVENT == 823 then
   Class = CheckClass (UID);
    if Class == 6 or Class == 8 or Class == 10 or Class == 12 then -- 2�� ���� ���ΰ� üũ 
   SelectMsg(UID, 2, 52, 3226, 14202, 10, 824, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else --2�� ������ �������� 
   SelectMsg(UID, 2, 52, 4711, 14202, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 823 then
   SelectMsg(UID, 2, 52, 3226, 14202, 10, 824, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 824 then
   SelectMsg(UID, 4, 52, 3227, 14202, 22, 825, 23, 831, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 825 then
   SaveEvent(UID, 3423);
   SelectMsg(UID, 2, 52, 3228, 14202, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 831 then
   SelectMsg(UID, 2, 52, 3229, 14202, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

-- collect all
local NATION = 0;--nation check

if EVENT == 826 then
   SaveEvent(UID, 3425);
   NATION = CheckNation(UID);
   if NATION == 1 then -- ī�罺 �϶�
      SelectMsg(UID, 1, 52, 3231, 14202, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- �����϶�
      SelectMsg(UID, 1, 52, 3232, 14202, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

local ITEM_COUNT1=0;
local ITEM_COUNT2=0;
local ITEM_COUNT3=0;
local RUN_EXCHANGE ;

if EVENT == 828 then
   ITEM_COUNT1 = HowmuchItem(UID, 379245000);
   ITEM_COUNT2 = HowmuchItem(UID, 379246000);
   ITEM_COUNT3 = HowmuchItem(UID, 379064000);
   if ITEM_COUNT1  > 0 and ITEM_COUNT2  > 0 and ITEM_COUNT3  > 0 then-- ��� ��������
      SelectMsg(UID, 4, 52, 3233, 14202, 41, 830, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else
      if ITEM_COUNT1 <= 0 then -- 1��� ������
        SelectMsg(UID, 2, 52, 3230, 14202, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      elseif ITEM_COUNT2 <= 0 then -- 2��� ������
         SelectMsg(UID, 2, 52, 3230, 14202, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      else -- 3��� ������
         SelectMsg(UID, 2, 52, 3230, 14202, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      end
   end
end


local Check;

if EVENT == 830 then
        Check = CheckExchange(UID, 330)
        if  Check == 1 then
            Exchange =RunExchange(UID, 330);
            if  Exchange ==0 then
            SaveEvent(UID, 3424);
            else
            Ret = 1;	
            end	 
        else
        Ret = 1;	
        end	 
end
--******************************************************--
-- 70Lv skill - end
--******************************************************--

--******************************************************--
-- 72Lv skill - start
local savenum = 512;
local NPC = 14202;
--******************************************************--

--seed or misel call

if EVENT == 920 then
   SelectMsg(UID, 1, savenum, 5122, NPC, 3006, 921, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end
--�õ�

if EVENT == 921 then
   ShowMap(UID, 306);
   SaveEvent(UID, 5125);
end

if EVENT == 922 then
   SelectMsg(UID, 1, savenum, 5123, NPC, 3006, 921, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end
--�̼�

--  type 0 or 4

if EVENT == 923 then
   Class = CheckClass (UID);
    if Class == 6 or Class == 8 or Class == 10 or Class == 12 then -- 2�� ���� ���ΰ� üũ 
    SelectMsg(UID, 2, savenum, 5125, NPC, 10, 924, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else --2�� �������������� 
    SelectMsg(UID, 2, savenum, 5124, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 924 then
   SelectMsg(UID, 4, savenum, 5126, NPC, 22, 925, 23, 931, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 925 then
   SaveEvent(UID, 5126);
   SelectMsg(UID, 2, savenum, 5127, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 931 then
   SelectMsg(UID, 2, savenum, 5128, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

-- collect all
local NATION = 0;--nation check

if EVENT == 926 then
   SaveEvent(UID, 5128);
   NATION = CheckNation(UID);
   if NATION == 1 then -- ī�罺 �϶�
      SelectMsg(UID, 1, savenum, 5130, NPC, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- �����϶�
      SelectMsg(UID, 1, savenum, 5131, NPC, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

local ITEM_COUNT1=0;
local ITEM_COUNT2=0;
local ITEM_COUNT3=0;
local ITEM_COUNT4=0;
local RUN_EXCHANGE ;

if EVENT == 928 then
   ITEM_COUNT1 = HowmuchItem(UID, 379241000);
   ITEM_COUNT2 = HowmuchItem(UID, 379236000);
   ITEM_COUNT3 = HowmuchItem(UID, 900000000);
   if ITEM_COUNT1  > 0 and ITEM_COUNT2  > 2 and ITEM_COUNT3 > 9999999 then-- ��� ��������
      SelectMsg(UID, 4, savenum, 5132, NPC, 41, 930, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else
      if ITEM_COUNT1 <= 0 then -- 1��� ������
        SelectMsg(UID, 2, savenum, 5129, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      elseif ITEM_COUNT2 <= 0 then -- 2��� ������
         SelectMsg(UID, 2, savenum, 5129, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      elseif ITEM_COUNT3 <= 0 then -- 3��� ������
         SelectMsg(UID, 2, savenum, 5129, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      else -- 4��� ������
         SelectMsg(UID, 2, savenum, 5129, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      end
   end
end


local Check;

if EVENT == 930 then
   Check = CheckExchange(UID, 522)
   if  Check == 1 then
   Exchange =RunExchange(UID, 522);
        if  Exchange ==0 then
        SaveEvent(UID, 5127);
        else
        Ret = 1;	
        end	 
  else
  Ret = 1;	
  end	 
end

--******************************************************--
-- 72Lv skill - end
--******************************************************--

--******************************************************--
-- 75Lv skill - start
local savenum = 513;
--******************************************************--

--seed or misel call

if EVENT == 1020 then
   SelectMsg(UID, 1, savenum, 5133, NPC, 3006, 1021, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end
--�õ�

if EVENT == 1021 then
   ShowMap(UID, 306);
   SaveEvent(UID, 5137);
end

if EVENT == 1022 then
   SelectMsg(UID, 1, savenum, 5134, NPC, 3006, 1021, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end
--�̼�

--  type 0 or 4

if EVENT == 1023 then
   Class = CheckClass (UID);
    if Class == 6 or Class == 8 or Class == 10 or Class == 12 then -- 2�� ���� ���ΰ� üũ 
    SelectMsg(UID, 2, savenum, 5136, NPC, 10, 1024, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else --2�� �������������� 
    SelectMsg(UID, 2, savenum, 5135, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 1024 then
   SelectMsg(UID, 4, savenum, 5137, NPC, 22, 1025, 23, 1031, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 1025 then
   SaveEvent(UID, 5138);
   SelectMsg(UID, 2, savenum, 5138, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 1031 then
   SelectMsg(UID, 2, savenum, 5139, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

-- collect all
local NATION = 0;--nation check

if EVENT == 1026 then
   SaveEvent(UID, 5140);
   NATION = CheckNation(UID);
   if NATION == 1 then -- ī�罺 �϶�
      SelectMsg(UID, 1, savenum, 5141, NPC, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- �����϶�
      SelectMsg(UID, 1, savenum, 5142, NPC, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

local ITEM_COUNT1=0;
local ITEM_COUNT2=0;
local ITEM_COUNT3=0;
local ITEM_COUNT4=0;
local RUN_EXCHANGE ;

if EVENT == 1028 then
   ITEM_COUNT1 = HowmuchItem(UID, 379246000);
   ITEM_COUNT2 = HowmuchItem(UID, 379236000);
   ITEM_COUNT3 = HowmuchItem(UID, 900000000);
   if ITEM_COUNT1  > 0 and ITEM_COUNT2  > 2 and ITEM_COUNT3 > 9999999 then-- ��� ��������
      SelectMsg(UID, 4, savenum, 5143, NPC, 41, 1030, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else
      if ITEM_COUNT1 <= 0 then -- 1��� ������
        SelectMsg(UID, 2, savenum, 5140, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      elseif ITEM_COUNT2 <= 0 then -- 2��� ������
         SelectMsg(UID, 2, savenum, 5140, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      elseif ITEM_COUNT3 <= 0 then -- 3��� ������
         SelectMsg(UID, 2, savenum, 5140, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      else -- 4��� ������
         SelectMsg(UID, 2, savenum, 5140, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      end
   end
end


local Check;

if EVENT == 1030 then
   Check = CheckExchange(UID, 523)
   if  Check == 1 then
   Exchange =RunExchange(UID, 523);
        if  Exchange ==0 then
        SaveEvent(UID, 5139);
        else
        Ret = 1;	
        end	 
  else
  Ret = 1;	
  end	 
end

--******************************************************--
-- 75Lv skill - end
--******************************************************--

--******************************************************--
-- 80Lv skill - start
local savenum = 514;
--******************************************************--

--seed or misel call

if EVENT == 1120 then
   SelectMsg(UID, 1, savenum, 5144, NPC, 3006, 1121, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end
--�õ�

if EVENT == 1121 then
   ShowMap(UID, 306);
   SaveEvent(UID, 5149);
end

if EVENT == 1122 then
   SelectMsg(UID, 1, savenum, 5145, NPC, 3006, 1121, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end
--�̼�

--  type 0 or 4

if EVENT == 1123 then
   Class = CheckClass (UID);
    if Class == 6 or Class == 8 or Class == 10 or Class == 12 then -- 2�� ���� ���ΰ� üũ 
    SelectMsg(UID, 2, savenum, 5147, NPC, 10, 1124, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else --2�� �������������� 
    SelectMsg(UID, 2, savenum, 5146, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 1124 then
   SelectMsg(UID, 4, savenum, 5148, NPC, 22, 1125, 23, 1131, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 1125 then
   SaveEvent(UID, 5150);
   SelectMsg(UID, 2, savenum, 5149, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 1131 then
   SelectMsg(UID, 2, savenum, 5150, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

-- collect all
local NATION = 0;--nation check

if EVENT == 1126 then
   SaveEvent(UID, 5152);
   NATION = CheckNation(UID);
   if NATION == 1 then -- ī�罺 �϶�
      SelectMsg(UID, 1, savenum, 5152, NPC, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- �����϶�
      SelectMsg(UID, 1, savenum, 5153, NPC, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

local ITEM_COUNT1=0;
local ITEM_COUNT2=0;
local ITEM_COUNT3=0;
local ITEM_COUNT4=0;
local RUN_EXCHANGE ;

if EVENT == 1128 then
   ITEM_COUNT1 = HowmuchItem(UID, 379245000);
   ITEM_COUNT2 = HowmuchItem(UID, 379236000);
   ITEM_COUNT3 = HowmuchItem(UID, 900000000);
   if ITEM_COUNT1  > 0 and ITEM_COUNT2  > 2 and ITEM_COUNT3 > 9999999 then-- ��� ��������
      SelectMsg(UID, 4, savenum, 5154, NPC, 41, 1130, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else
      if ITEM_COUNT1 <= 0 then -- 1��� ������
        SelectMsg(UID, 2, savenum, 5151, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      elseif ITEM_COUNT2 <= 0 then -- 2��� ������
         SelectMsg(UID, 2, savenum, 5151, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      elseif ITEM_COUNT3 <= 0 then -- 3��� ������
         SelectMsg(UID, 2, savenum, 5151, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      else -- 4��� ������
         SelectMsg(UID, 2, savenum, 5151, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      end
   end
end


local Check;

if EVENT == 1130 then
   Check = CheckExchange(UID, 524)
   if  Check == 1 then
   Exchange =RunExchange(UID, 524);
        if  Exchange ==0 then
        SaveEvent(UID, 5151);
        else
        Ret = 1;	
        end	 
  else
  Ret = 1;	
  end	 
end

--******************************************************--
-- 80Lv skill - end
--******************************************************--



return Ret;