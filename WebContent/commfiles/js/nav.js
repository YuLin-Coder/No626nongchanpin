// �����������ļ�
var outlookbar=new outlook();
var t;

t=outlookbar.addtitle('�����','�����',1)
outlookbar.additem('�齱�����',t,'addmarnavs.jsp')
outlookbar.additem('�齱�ά��',t,'marnavs.jsp')
outlookbar.additem('�û��齱���',t,'../pages/cyyhtj.jsp')

t=outlookbar.addtitle('ϵͳ����','ϵͳ����',1)
outlookbar.additem('��ӹ���Ա',t,'addsysusers.jsp')
outlookbar.additem('����Աά��',t,'sysusers.jsp')
outlookbar.additem('ϵͳ��ɫά��',t,'uroles.jsp')
outlookbar.additem('ϵͳ��Ϣ����',t,'notices.jsp')

	


t=outlookbar.addtitle('�����ռ�','�����ռ�',1)
outlookbar.additem('�̲ķ���',t,'../feedBack/bookListDiscuss.html')
outlookbar.additem('��������',t,'../feedBack/discussUser.html')
outlookbar.additem('����ͳ��',t,'../feedBack/bookListDetails.html')	

t=outlookbar.addtitle('�̲�ѡ��','�̲�ѡ��',1)
outlookbar.additem('�̲�ѡ�������д',t,'../bookSelect/bookSelectInsert.html')
outlookbar.additem('�̲�ѡ�����ͳ��',t,'../bookSelect/bookSelectCount.html')
outlookbar.additem('�̲�ѡ������Ա�',t,'../bookSelect/bookSelectCompare.html')
outlookbar.additem('�̲�ѡ�������ѯ',t,'../bookSelect/bookSelectQuery.html')
//outlookbar.additem('�̲�ίԱ�����',t,'../bookSelect/bookCommitteeManagemengt.html')
outlookbar.additem('�̲�ίԱ����Ϣ����',t,'../bookSelect/MaterialsCommitteeManagement.html')

t=outlookbar.addtitle('�鿴��־','�鿴��־',1)
outlookbar.additem('��־����',t,'lotlogs.jsp')


t=outlookbar.addtitle('������Ϣ','������Ϣ',1)
outlookbar.additem('�������Ϲ���',t,'pupdatesysusers.jsp')
outlookbar.additem('�޸ĵ�¼����',t,'../pages/updatepwd.jsp')

t=outlookbar.addtitle('ͳ�Ʒ���','ͳ�Ʒ���',1)
outlookbar.additem('�齱��Ϣͳ��',t,'../pages/marnavstj.jsp')
outlookbar.additem('�н���Ϣͳ��',t,'../pages/zjtj.jsp')



t=outlookbar.addtitle('�ͻ��˹���','�ͻ��˹���',1)
outlookbar.additem('�ͻ��˲�ѯ',t,'../pages/applist.jsp')
outlookbar.additem('�ͻ��˷���',t,'../pages/addapp.jsp')




