
!      ��ѹԭʼ����ģʽ��Barotropic primitive equation model��

!      m=20��      γ������
!      n=16��      ��������
!      d��         �����
!      rm��        ��ͼ�Ŵ�ϵ��
!      f��         ��ת����
!      w��         ��������
!      cla��clo��  ��������γ�Ⱥ;���
!      dt��        ʱ�䲽��
!      s��         ƽ��ϵ��
!      ua��ub��uc��n-1��n��n+1ʱ����γ�����
!      va��vb��vc��n-1��n��n+1ʱ���ľ������
!      za��zb��zc��n-1��n��n+1ʱ����λ�Ƹ߶�
!      na��        ����12СʱԤ���Ĳ���
!      nb��        ��¼ʱ����ֲ����Ĳ���
!      nt2=72��    �б��Ƿ����12Сʱ���Ƿ�����ڵ�ƽ����
!      nt4=6��     �ж��Ƿ�����߽�ƽ����
!      nt5=36��    �ж��Ƿ����ʱ��ƽ���� 
!      zo��        Ϊ�˼�С���������Ⲩ�Ĳ��٣����Ӳ�ָ�ʽ���ȶ��Զ������λ�Ƹ߶ȡ�
!      ni:         �Ƿ���г�ʼ�糡�ľ�����ʼ����
!                  ni=0Ϊ�����г�ʼ����ʹ�ö���ķ糡�͸߶ȳ���
!                  ni=1Ϊ���г�ʼ������Ҫλ�Ƹ߶ȳ�����ֵ���ɡ�


			program Barotropic_Model
			parameter(m=20,n=16,d=300000.0,cla=51.0,clo=118.0,dt=600.0)
      dimension ua(m,n),va(m,n),za(m,n),ub(m,n),vb(m,n),zb(m,n),uc(m,n),vc(m,n),zc(m,n),rm(m,n),f(m,n),w(m,n)
			zo=2500.0
			s=0.5
      nt2=72
      nt4=6
      nt5=36
      c1=dt/2.0
      c2=dt*2.0

			write(*,*)
			write(*,*)'����������ӭʹ����ѹԭʼ����ģʽ��������'
			write(*,*)
			write(*,*)'���ļ��������ʼ����׼��������ļ�...........'

      open(11,file='C:\Users\48753\Desktop\NWP\02\data\practice\Input\za.dat')                   ! ����ĸ߶ȳ����ı���
      open(12,file='C:\Users\48753\Desktop\NWP\02\data\practice\Input\ua.dat')								! �����u�糡���ı���
      open(13,file='C:\Users\48753\Desktop\NWP\02\data\practice\Input\va.dat')                    ! �����v�糡���ı���
					
      open(17,file='C:\Users\48753\Desktop\NWP\02\data\practice\Input\za.grd',form='binary') 		  ! ����ĸ߶ȳ��������ƣ�	
      open(18,file='C:\Users\48753\Desktop\NWP\02\data\practice\Input\ua.grd',form='binary') 		  ! �����u�糡�������ƣ�				
      open(19,file='C:\Users\48753\Desktop\NWP\02\data\practice\Input\va.grd',form='binary') 		  ! �����v�糡�������ƣ�				
			    	
      open(21,file='C:\Users\48753\Desktop\NWP\02\data\practice\Output\rm.dat')                   ! ��ͼ�Ŵ�ϵ��
      open(22,file='C:\Users\48753\Desktop\NWP\02\data\practice\Output\f.dat')                    ! ��ת����
					
      open(23,file='C:\Users\48753\Desktop\NWP\02\data\practice\Output\ub.dat')                   ! ������ʼ���õ���u�糡���ı���
        open(24,file='C:\Users\48753\Desktop\NWP\02\data\practice\Output\ub.grd',form='binary')     ! ������ʼ���õ���u�糡�������ƣ�
      open(25,file='C:\Users\48753\Desktop\NWP\02\data\practice\Output\vb.dat')                   ! ������ʼ���õ���v�糡���ı���
        open(26,file='C:\Users\48753\Desktop\NWP\02\data\practice\Output\vb.grd',form='binary')     ! ������ʼ���õ���v�糡�������ƣ�

      open(27,file='C:\Users\48753\Desktop\NWP\02\data\practice\Output\zc.dat')                   ! Ԥ���ĸ߶ȳ����ı���
			open(28,file='C:\Users\48753\Desktop\NWP\02\data\practice\Output\zc.grd',form='binary')     ! Ԥ���ĸ߶ȳ��������ƣ�
			open(29,file='C:\Users\48753\Desktop\NWP\02\data\practice\Output\uc.dat')                   ! Ԥ����u�糡���ı���
			open(30,file='C:\Users\48753\Desktop\NWP\02\data\practice\Output\uc.grd',form='binary')     ! Ԥ����u�糡�������ƣ�
			open(31,file='C:\Users\48753\Desktop\NWP\02\data\practice\Output\vc.dat')                   ! Ԥ����v�糡���ı���
			open(32,file='C:\Users\48753\Desktop\NWP\02\data\practice\Output\vc.grd',form='binary')     ! Ԥ����v�糡�������ƣ�


!  �����ʼ���ϳ� 
  		read(11,'(20f6.0)')za 
  		read(12,'(20f10.5)')ua 
  		read(13,'(20f10.5)')va 

			write(*,*)
			write(*,*)'����ʼ�߶ȳ��ͷ糡д�ɶ������ļ�������Grads��ͼ......'
 			write(17)((za(i,j),i=1,m),j=1,n)   
 			write(18)((ua(i,j),i=1,m),j=1,n)   
 			write(19)((va(i,j),i=1,m),j=1,n)   

!  ����Ŵ�ϵ���͵�ת����,��д�������ļ���
			write(*,*)
			write(*,*)'����ÿ������ϵĵ�ͼ�Ŵ�ϵ���͵�ת��������д���Ӧ����ļ�......'
      call cmf(rm,f,d,cla,m,n)
      write(21,'(20f10.5)')rm
      write(22,'(20e15.5)')f
 
			write(*,*)
			write(*,*)'����������0��1�󰴻س����У�0��ʾ�����о�����ʼ����1��ʾ���о�����ʼ����'
			write(*,*)
			write(*,*)'ע�⣺������ת����ӳ��򣨷糡��ʼ����δ��ɣ���ֻ����������0��'
			read(*,*)ni
            write(*,*)'����������1��2�󰴻س����У�l=1Ϊִֻ����ƽ����l=2Ϊִ������ƽ��'
            read(*,*)l
  
			if(ni==1)then
!  �����ת���ֵ 
				write(*,*)'���о�����ʼ�����ɷ糡����߶ȳ�.....'  
				call cgw(ua,va,za,rm,f,d,m,n)
				write(23,'(20f10.5)')ua
 				write(24)((ua(i,j),i=1,m),j=1,n) 
				write(25,'(20f10.5)')va
 				write(26)((va(i,j),i=1,m),j=1,n)
			elseif(ni==0)then
				write(*,*)'�����о�����ʼ��ʹ�ø�����λ�Ƹ߶ȳ��ͷ糡......'
			else
				write(*,*)'��!!!�����˴����ַ������������г�������0��1��'
				goto 90

			endif
				

!   ��ֵ�����ӳ���
			write(*,*)
			write(*,*)'�̶��߽�������ֵ........'
      call tbv(ub,vb,zb,ua,va,za,m,n)
      call tbv(uc,vc,zc,ua,va,za,m,n)

!   ��ʼԤ��  
			write(*,*)
			write(*,*)'��ʼ12СʱԤ��.......'
      do na=1,2
				nb=0
!   ŷ��������1Сʱ
				do nn=1,6
					call ti(ua,va,za,ua,va,za,ub,vb,zb,rm,f,d,dt,zo,m,n)
					call ti(ua,va,za,ub,vb,zb,ua,va,za,rm,f,d,dt,zo,m,n)
					nb=nb+1
				enddo

!   �߽�ƽ���ӳ���
				call ssbp(za,w,s,m,n)
				call ssbp(ua,w,s,m,n)
				call ssbp(va,w,s,m,n)

!   ǰ����ְ벽
				call ti(ua,va,za,ua,va,za,ub,vb,zb,rm,f,d,c1,zo,m,n)
!   �������ְ벽
				call ti(ua,va,za,ub,vb,zb,uc,vc,zc,rm,f,d,dt,zo,m,n)
				nb=nb+1
!  ���鴫���ӳ���
				call ta(ub,vb,zb,uc,vc,zc,m,n)
!  ��������һ��,������11Сʱ
				do nn=1,66
					call ti(ua,va,za,ub,vb,zb,uc,vc,zc,rm,f,d,c2,zo,m,n)
					nb=nb+1
!  ��ӡ���ֲ���,na��ѭ����,nbСѭ����
					call pv(na,nb)
!  �ж��Ƿ����12Сʱ
					if(nb.eq.nt2) go to 80
!  �ж��Ƿ����߽�ƽ��
					if(nb/nt4*nt4.eq.nb)then
						call ssbp(zc,w,s,m,n)
						call ssbp(uc,w,s,m,n)
						call ssbp(vc,w,s,m,n)
					else	
!  �ж��Ƿ���ʱ��ƽ��
						if(nb.eq.nt5 .or. nb.eq.nt5+1)then
!  ʱ��ƽ���ӳ���
							call ts(ua,ub,uc,va,vb,vc,za,zb,zc,s,m,n)
						else
!  ���鴫��,Ϊ��һ�ֻ�����׼��
							call ta(ua,va,za,ub,vb,zb,m,n)
							call ta(ub,vb,zb,uc,vc,zc,m,n)
						endif
					endif
				enddo

!  �����ڵ�ƽ��
  80		call ssip(zc,w,s,m,n,k,l)
				call ssip(uc,w,s,m,n,k,l)
				call ssip(vc,w,s,m,n,k,l)

!  ��ӡ���ֲ���
				call pv(na,nb)

!  ���鴫��,Ϊ��12Сʱ�Ļ�����׼��
				call ta(ua,va,za,uc,vc,zc,m,n)
			enddo

!  ���Ԥ�����
			write(*,*)
			write(*,*)'���Ԥ�����.......'
      write(27,'(20f6.0)') zc
			write(28) ((zc(i,j),i=1,m),j=1,n)    
      write(29,'(20f10.5)')uc
			write(30) ((uc(i,j),i=1,m),j=1,n) 
      write(31,'(20f10.5)')vc
			write(32) ((vc(i,j),i=1,m),j=1,n) 
			write(*,*)
			write(*,*)'������Ԥ������������'
90			stop
			
      end




!     computing map factors and coriolis parameter
!     rk:  Բ׶����
!     rlq: ������ͶӰӳ��ƽ���ϳ����������ľ���
!     a:   ����뾶
!     sita:��׼��γ
!     psx: ����������γ
!     r:   ģʽ���ĵ������ľ���
      subroutine cmf(rm,f,d,cla,m,n)
      dimension rm(m,n),f(m,n)
      rk=0.7156
      rlq=11423370.0
      a=6371000.0
      conv=57.29578
      w1=2.0/rk
      sita=30.0/conv
      psx=(90.0-cla)/conv

!  ����ģʽ���ĵ������ľ���r 
      cel0=a*sin(sita)/rk
      cel=(tan(psx/2.0))/(tan(sita/2.0))
      r=cel0*cel**rk

!  ȷ����������ԭ���ڵ�ͼ����ϵ�е�λ��
      xi0=-(m-1)/2.0
      yj0=r/d+(n-1)/2.0

!  ��������������ľ���rl,(xj,yi)Ϊģʽ������ڵ�ͼ����ϵ�е�λ��  
      do i=1,m
				do j=1,n
					xi=xi0+(i-1)
					yj=yj0-(j-1)
					rl=sqrt(xi**2+yj**2)*d

!  ��Ŵ�ϵ��rm�Ϳ��ϲ���f
					w2=(rl/rlq)**w1
					sinl=(1.0-w2)/(1.0+w2)
					rm(i,j)=rk*rl/(a*sqrt(1.0-sinl**2))
					f(i,j)=1.4584e-4*sinl
				enddo
			enddo
      return
      end

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!    computing geostrophic winds
!    ��ͬѧ��д��ת���ֵ���ӳ��򣡣���Ӧ�����У�4.134��ʽ��μ�ʵϰ˵���ĵ�
      subroutine cgw(ua,va,za,rm,f,d,m,n)
      dimension ua(m,n),va(m,n),za(m,n),rm(m,n),f(m,n)
      integer m,n,i,j
      real d
      !u
      do i=1,m;
          do j=2,n-1
          ua(i,j)=-rm(i,j)*9.8/f(i,j)*(za(i,j+1)-za(i,j-1))/d/2.0
          enddo;
      enddo;
		do i=2,m-1;
            do j=1,n
          va(i,j)= rm(i,j)*9.8/f(i,j)*(za(i+1,j)-za(i-1,j))/d/2.0
            enddo;
        enddo
      do j=1,n
          va(1,j)= rm(1,j)*9.8/f(1,j)*(za(2,j)-za(1,j))/d
          va(m,j)= rm(m,j)*9.8/f(m,j)*(za(m,j)-za(m-1,j))/d
      enddo
      do i=1,m
          ua(i,1)=-rm(i,1)*9.8/f(i,1)*(za(i,2)-za(i,1))/d
          ua(i,n)=-rm(i,n)*9.8/f(i,n)*(za(i,n)-za(i,n-1))/d
      enddo
      
      end
          



      
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!     time integrations
      subroutine ti(ua,va,za,ub,vb,zb,uc,vc,zc,rm,f,d,dt,zo,m,n)
      dimension ua(m,n),va(m,n),za(m,n),ub(m,n),vb(m,n),zb(m,n),uc(m,n),vc(m,n),zc(m,n),rm(m,n),f(m,n)
			c=0.25/d
      m1=m-1
      n1=n-1
      do i=2,m1
				do j=2,n1
					e=-c*rm(i,j)*((ub(i+1,j)+ub(i,j))*(ub(i+1,j)-ub(i,j))+(ub(i,j)+ub(i-1,j))*(ub(i,j)-ub(i-1,j))   &
						+(vb(I,j-1)+vb(i,j))*(ub(i,j)-ub(i,j-1))+(vb(I,j)+vb(i,j+1))*(ub(i,j+1)-ub(i,j))              &
						+19.6*(zb(i+1,j)-zb(i-1,j)))+f(i,j)*vb(i,j)
					uc(i,j)=ua(i,j)+e*dt
					g=-c*rm(i,j)*((ub(I+1,j)+ub(i,j))*(vb(i+1,j)-vb(i,j))+(ub(I,j)+ub(i-1,j))*(vb(i,j)-vb(i-1,j))   &
						+(vb(I,j-1)+vb(i,j))*(vb(i,j)-vb(i,j-1))+(vb(I,j)+vb(i,j+1))*(vb(i,j+1)-vb(i,j))              &
						+19.6*(zb(i,j+1)-zb(i,j-1)))-f(i,j)*ub(i,j)
					vc(i,j)=va(i,j)+g*dt
				enddo
			enddo
      do i=2,m1
				do j=2,n1
					h=-c*rm(i,j)*((ub(I+1,j)+ub(i,j))*(zb(i+1,j)-zb(i,j))+(ub(I,j)+ub(i-1,j))*(zb(i,j)-zb(i-1,j))   &
						+(vb(I,j-1)+vb(i,j))*(zb(i,j)-zb(i,j-1))+(vb(I,j)+vb(i,j+1))*(zb(i,j+1)-zb(i,j))              &
						+2.0*(zb(i,j)-zo)*(ub(i+1,j)-ub(i-1,j)+vb(i,j+1)-vb(i,j-1)))
					zc(i,j)=za(i,j)+h*dt
				enddo
			enddo
			return
      end

!     time smoothimg
      subroutine ts(ua,ub,uc,va,vb,vc,za,zb,zc,s,m,n)
      dimension ua(m,n),va(m,n),za(m,n),ub(m,n),vb(m,n),zb(m,n),uc(m,n),vc(m,n),zc(m,n)
      m1=m-1
      n1=n-1
      do i=2,m1
				do j=2,n1
					ub(i,j)=ub(i,j)+s*(ua(i,j)+uc(i,j)-2.0*ub(i,j))/2.0
					vb(i,j)=vb(i,j)+s*(va(i,j)+vc(i,j)-2.0*vb(i,j))/2.0
					zb(i,j)=zb(i,j)+s*(za(i,j)+zc(i,j)-2.0*zb(i,j))/2.0
				enddo
			enddo
      return
      end

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!     space smoothing for internal points ������5��ƽ��(����ƽ��)
!   ��ͬѧ��д������5��ƽ��(����ƽ��)���ӳ��򣡣���Ӧ�����У�4.126��ʽ��μ�ʵϰ˵���ĵ�
!     l=1Ϊִֻ����ƽ����l=2Ϊִ������ƽ��
      subroutine ssip(a,w,s,m,n,k,l)
      dimension a(m,n),w(m,n)
      integer m,n,k,l
      real s
		k=-1
        DO i=2,m-1
            do j=2,n-1
				w(i,j)=a(i,j)+s*0.25*(a(i+1,j)+a(i-1,j)+a(i,j+1)+a(i,j-1)-4*a(i,j))
            enddo
        enddo
        do i=2,m-1
            do j=2,n-1
                a(i,j)=w(i,j)
            enddo
        enddo
        
        if (l==2) then
        DO i=2,m-1
            do j=2,n-1
				w(i,j)=a(i,j)+s*0.25*k*(a(i+1,j)+a(i-1,j)+a(i,j+1)+a(i,j-1)-4*a(i,j))
            enddo
        enddo
        endif
        
        do i=2,m-1
            do j=2,n-1
                a(i,j)=w(i,j)
            enddo
        enddo
        
        return
        end
        
		!	subroutine ssip(a,w,s,m,n,k,l)
		!!   ��������            
		!	  dimension a(m,n),w(m,n)
		!!   ִ����ƽ�� 
		!	  m1 = m-1
		!	  n1 = n-1
		!	  if(l==1)then           
		!	  do 10 i=2,m1       
		!	  do 10 j=2,n1       
		!  10  w(i,j)=a(i,j)+s*(a(i-1,j)+a(i+1,j)+a(i,j-1)+a(i,j+1)-4*a(i,j))/4.0 
		!	  do 20 i=2,m1   
		!	  do 20 j=2,n1   
		!  20  a(i,j)=w(i,j) 
		!	  return 
		!!   ִ������ƽ�� 
		!	  else 
		!	  do 30 i=2,m1  
		!	  do 30 j=2,n1 
		!  30  w(i,j)=a(i,j)+s*(a(i-1,j)+a(i+1,j)+a(i,j-1)+a(i,j+1)-4*a(i,j))/4.0    
		!	  do 40 i=2,m1 
		!	  do 40 j=2,n1 
		!  40  a(i,j)=w(i,j) 
		!	  do 50 i=2,m1 
		!	  do 50 j=2,n1  
		!  50  w(i,j)=a(i,j)+(-s)*(a(i-1,j)+a(i+1,j)+a(i,j-1)+a(i,j+1)-4*a(i,j))/4.0    
		!	  do 60 i=2,m1  
		!	  do 60 j=2,n1   
		!  60  a(i,j)=w(i,j)
		!	  return
		!	  endif    
		!	  end 







!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  
!     space smoothing for boundary points �߽�ŵ�ƽ��
      subroutine ssbp(a,w,s,m,n)
      dimension a(m,n),w(m,n)
      m1=m-1
      m3=m-3
      n1=n-1
      n2=n-2
      n3=n-3
      do i=2,m1
				do j=2,n1,n3
					w(i,j)=a(i,j)+0.5*s*(1.0-s)*(a(i-1,j)+a(i+1,j)+a(i,j-1)+a(i,j+1)-4.0*a(i,j))    &
									+0.25*s*s*(a(i-1,j-1)+a(i-1,j+1)+a(i+1,j-1)+a(i+1,j+1)-4.0*a(i,j))
				enddo
			enddo
      do i=2,m1,m3
				do j=3,n2
					w(i,j)=a(i,j)+0.5*s*(1.0-s)*(a(i-1,j)+a(i+1,j)+a(i,j-1)+a(i,j+1)-4.0*a(i,j))    &
									+0.25*s*s*(a(i-1,j-1)+a(i-1,j+1)+a(i+1,j-1)+a(i+1,j+1)-4.0*a(i,j))
				enddo
			enddo
      do i=2,m1
				do j=2,n1,n3
					a(i,j)=w(i,j)
				enddo
			enddo
      do i=2,m1,m3
				do j=3,n2
					a(i,j)=w(i,j)
				enddo
			enddo
			return
      end


!     transmiting arrays  ���鴫��
      subroutine ta(ua,va,za,ub,vb,zb,m,n)
      dimension ua(m,n),va(m,n),za(m,n),ub(m,n),vb(m,n),zb(m,n)
      do i=1,m
				do j=1,n
					ua(i,j)=ub(i,j)
					va(i,j)=vb(i,j)
					za(i,j)=zb(i,j)
				enddo
			enddo
      return
      end

!     transmiting boundary valaus  ���̶��߽�ֵ
      subroutine tbv(ua,va,za,ub,vb,zb,m,n)
      dimension ua(m,n),va(m,n),za(m,n),ub(m,n),vb(m,n),zb(m,n)
      m1=m-1
      n1=n-1
      do i=1,m
				do j=1,n,n1
					ua(i,j)=ub(i,j)
					va(i,j)=vb(i,j)
					za(i,j)=zb(i,j)
				enddo
			enddo
      do i=1,m,m1
				do j=1,n
					ua(i,j)=ub(i,j)
					va(i,j)=vb(i,j)
					za(i,j)=zb(i,j)
				enddo
			enddo
      return
      end

!     printing variables  ��ӡ���ֲ���
      subroutine pv(na,nb)
      write(*,'(5x,3hna=,i3,5x,3hnb=,i2/)')na,nb
      return
      end  