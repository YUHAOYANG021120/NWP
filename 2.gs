* 绘制初始的位势高度场和风场

'reinit'   
#'enable print D:\practice\initial.gmf'
'open C:\Users\48753\Desktop\NWP\02\data\practice\Output\zc.ctl'
'set grid off'
'set grads off'
'd za'
'draw title Forward and Backward Smoothing HGT'
#'print'
'gxprint C:\Users\48753\Desktop\NWP\02\data\practice\2za.png white'
'c'
'close 1'
'open C:\Users\48753\Desktop\NWP\02\data\practice\Output\uc.ctl'
'open C:\Users\48753\Desktop\NWP\02\data\practice\Output\vc.ctl'
'set grid off'
'set grads off'
'd ua.1;va.2'
'draw title Forward and Backward Smoothing Wind'
#'print'
'gxprint C:\Users\48753\Desktop\NWP\02\data\practice\2Va.png white'
'reinit'

#com
'open C:\Users\48753\Desktop\NWP\02\data\practice\Output\zc.ctl'
'open C:\Users\48753\Desktop\NWP\02\data\practice\Output\uc.ctl'
'open C:\Users\48753\Desktop\NWP\02\data\practice\Output\vc.ctl'
'set grid off'
'set grads off'
'd za'
'd ua.2;va.3'
'draw title  Forward and Backward Smoothing Hgt and Wind'
#'print'
'gxprint C:\Users\48753\Desktop\NWP\02\data\practice\2.png white'
'reinit'

*jinglichushihua
'reinit'   
#'enable print D:\practice\initial.gmf'
'open C:\Users\48753\Desktop\NWP\02\data\practice\Output\zc.ctl'
'set grid off'
'set grads off'
'd za'
'draw title Forward and Backward Smoothing HGT'
#'print'
'gxprint C:\Users\48753\Desktop\NWP\02\data\practice\3za.png white'
'c'
'close 1'
'open C:\Users\48753\Desktop\NWP\02\data\practice\Output\ub.ctl'
'open C:\Users\48753\Desktop\NWP\02\data\practice\Output\vb.ctl'
'set grid off'
'set grads off'
'd ua.1;va.2'
'draw title Forward and Backward Smoothing Wind'
#'print'
'gxprint C:\Users\48753\Desktop\NWP\02\data\practice\3Va.png white'
'reinit'

#com
'open C:\Users\48753\Desktop\NWP\02\data\practice\Output\zc.ctl'
'open C:\Users\48753\Desktop\NWP\02\data\practice\Output\ub.ctl'
'open C:\Users\48753\Desktop\NWP\02\data\practice\Output\vb.ctl'
'set grid off'
'set grads off'
'd za'
'd ua.2;va.3'
'draw title  Forward and Backward Smoothing Hgt and Wind'
#'print'
'gxprint C:\Users\48753\Desktop\NWP\02\data\practice\3.png white'
'reinit'

                                                         