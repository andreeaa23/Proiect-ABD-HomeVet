   M S B A M L   `   `   `  ????K  GCabinetVeterinar, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:CabinetVeterinarCabinetVeterinar  5   	   )    #CabinetVeterinar.ValidareProgramari   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   0localclr-namespace:CabinetVeterinar     5   	   -   5          ? Title$  ValidareProgramari??5   	   $	??460??6$   $	??780??61    ? Icon$ /Images/Vetlogo.png??6=    ? WindowStartupLocation$ CenterScreen=?5	   
    ? 
ResizeMode$ NoResize=?6/   .??5
      ? ??5   
   ?? 5       ?? EndPoint$ 0.5,1&?6"    ?? 
StartPoint$ 0.5,0&?63   .??5      ?  ? Color$ Black??6    ? Offset$ 0Q?6-   ? 5      $ 	#FF772864??6   $ 1Q?61   5      .+?5   
   &   System.Windows.Controls.DataGrid  -   5          Name$ dataGridProgramari??5      	   AutoGenerateColumns	 .  
??????????#C0C0C0$
??Left=?6r   $	??311??6?   $??	47,48,0,0q?6?   $	??Top=?6?   $	??695??6?   
 ? 	Resources
 5      =  7System.Windows.Controls.Primitives.DataGridColumnHeader ?? 
TargetType ?? Property ?? Value??%?   '        ?? 5      "  6   .?5      ??  ? ??
 ?????63   ?? 5       ? ??$ SemiBold"?63   ?? 5       ? ??$ Center=?6<   5      5         Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ IdProgramare??6%      Width5  /System.Windows.Controls.DataGridLengthConverter$	 120 6V   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6;   ?? *idProg+6V     5      $ Stapan??6%   $	 120 6T    65   ?? *
numeStapan+6T     5      $ Pacient??6%   $	 120 6V    66   ?? *numePacient+6V     5      $ Specie??6%   $	 120 6P    65   ?? *specie+6P     5       $
 Data??6%   $ 80 6L    63   ?? *data+6L     5!      $	 Tip??6%   $	 180 6J    62   ?? *tip+6J   5$      ?? 5%   
   -   5         ??Name$ BtnAcceptare??5%      
??????????#C0C0C0$??Accepta??6N   $
??Left=?6`   $??
63,380,0,0q?6{   $	??Top=?6?   $	??137??6?   $??30??6?   $??16(?6?   6?   ?? 5&   
   -   5        $ BtnRaspingere??5&      
??????????#C0C0C0$??Respinge??6O   $
??Left=?6b   $??241,380,0,0q?6}   $	??Top=?6?   $	??137??6?   $??30??6?   $??16(?6?   6?   ?? 5'   
   -   5        $ 	BtnCancel??5'      
??????????#C0C0C0$
??Back??6K   $
??Left=?6Z   $??605,380,0,0q?6u   $	??Top=?6?   $	??137??6?   $??30??6?   $??16(?6?   6?   5)      5*      