@echo off
rem //���ñ��� 
set NAME="��̫��"
rem //��������ֵ���Ը�����Ҫ����
set ADDR=192.168.1.55
set MASK=255.255.255.0
set GATEWAY=192.168.1.1
set DNS1=
set DNS2=
rem //������������ΪIP��ַ���������롢���ء���ѡDNS������DNS


echo ��ǰ���ò����У�
echo 1 ����Ϊ��̬IP
echo 2 ����Ϊ��̬IP
echo 3 �˳�
echo ��ѡ���س���
set /p operate=
if %operate%==1 goto 1
if %operate%==2 goto 2
if %operate%==3 goto 3


:1
echo �������þ�̬IP�����Ե�...
rem //���Ը��������Ҫ���� 
echo IP��ַ = %ADDR%
echo ���� = %MASK%
echo ���� = %GATEWAY%
netsh interface ipv4 set address %NAME% static %ADDR% %MASK% %GATEWAY% 
rem //echo ��ѡDNS = %DNS1% 
rem //netsh interface ipv4 set dns %NAME% static %DNS1%
rem //echo ����DNS = %DNS2% 
rem //if "%DNS2%"=="" (echo DNS2Ϊ��) else (netsh interface ipv4 add dns %NAME% %DNS2%) 
echo ��̬IP�����ã�
pause
goto 3


:2
echo �������ö�̬IP�����Ե�...
echo ���ڴ�DHCP�Զ���ȡIP��ַ...
netsh interface ip set address %NAME% dhcp
echo ���ڴ�DHCP�Զ���ȡDNS��ַ...
netsh interface ip set dns %NAME% dhcp 
echo ��̬IP�����ã�
pause
goto 3


:3
exit