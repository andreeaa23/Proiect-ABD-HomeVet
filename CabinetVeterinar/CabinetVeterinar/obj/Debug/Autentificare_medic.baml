   M S B A M L   `   `   `  ????K  GCabinetVeterinar, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:CabinetVeterinarCabinetVeterinar  5   	   *    $CabinetVeterinar.Autentificare_medic   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   0localclr-namespace:CabinetVeterinar     5   	   -   5          ? Title$  Autentificare_medic??5   	   $	??450??6%   $	??780??62    ? Icon$ /Images/Vetlogo.png??6>    ? WindowStartupLocation$ CenterScreen=?5	   
    ? 
ResizeMode$ NoResize=?6/   .??5
      ? ??5   
   ?? 5       ?? EndPoint$ 0.5,1&?6"    ?? 
StartPoint$ 0.5,0&?63   .??5      ?  ? Color$ Black??6    ? Offset$ 0Q?6-   ? 5      $ 	#FF772864??6   $ 1Q?61   5      .+?5   
   ?? -   5         ??Name$ 
BtnImagine??5      $??/Images/Vetlogo.png??6$   $
??Left=?6A   $??64??6\   $??	10,10,0,0q?6h   $	??Top=?6{   $	??177??6?   $??2??6?   ?? 5   
   -   5        	 ??Name$	 LblUserName??5      ???#C0C0C0$??Hello, UserName??6;   $
??Left=?6U   $??
430,10,0,0q?6p   $	??Top=?6?   $	??273??6?   $??16(?6?   $??32??6?   ?? 5   
   -   5        
 ??Name$
 BtnProgramare??5      
??????????#C0C0C0$??Accepta/Respinge??6O   $
??Left=?6j   $??
21,114,0,0q?6?   $	??Top=?6?   $	??166??6?   $??39??6?   $??16(?6?   6?   ?? 5   
   -   5        $
 BtnRaspunsuri??5      $??Raspunde la intrebari??6(   
??????????#C0C0C0$
??Left=?6o   $??
21,189,0,0q?6?   $	??Top=?6?   $	??166??6?   $??39??6?   $??16(?6?   6?   ?? 5   
   -   5        $
 BtnUpdatareProgramare??5      
??????????#C0C0C0$??Actualizare programare??6W   $
??Left=?6x   $??
21,341,0,0q?6?   $	??Top=?6?   $	??166??6?   $??39??6?   $??15(?6?   6?   ?? 5   
   -   5        $
 BtnListaProgramari??5      
??????????#C0C0C0$??Lista programari??6T   $
??Left=?6o   $??
21,268,0,0q?6?   $	??Top=?6?   $	??166??6?   $??39??6?   $??16(?6?   6?   &   System.Windows.Controls.DataGrid  5   
   -   5          Name$ gridListaProgramari??5      $
??Left=?60   
??????????#C0C0C0$	??272??6r   $??
227,77,0,0q?6   $	??Top=?6?   $	??518??6?    ? 	Resources 5      =  7System.Windows.Controls.Primitives.DataGridColumnHeader ?? 
TargetType ?? Property ?? Value??%?   '        ?? 5      "  6   .?5      ??  ? ??
 ?????63   ?? 5       ? ??$ SemiBold"?63   ?? 5       ? ??$ Center=?6<   5      5          Columns 5!      0  *System.Windows.Controls.DataGridTextColumn  5"      ,  &System.Windows.Controls.DataGridColumn   Header$ Stapan??6%      Width5  /System.Windows.Controls.DataGridLengthConverter$	 120 6T   1  +System.Windows.Controls.DataGridBoundColumn   Binding 65   ?? *
numeStapan+6T     5#      $ Pacient??6%   $	 120 6V    66   ?? *numePacient+6V     5$      $ Specie??6%   $	 100 6P    65   ?? *specie+6P     5%      $
 Data??6%   $ 70 6L    63   ?? *data+6L     5&      $	 Tip??6%   $ 50 6J    62   ?? *tip+6J     5'      $	 Ora??6%   $ 50 6J    62   ?? *ora+6J   5*      ?? 5+   
   -	   5        $
 BtnDeconectare??5+      
??????????#C0C0C0$??Deconectare??6P   $
??Left=?6f   $??608,367,0,0q?6?   $	??Top=?6?   $	??137??6?   $??30??6?   $??16(?6?   6?   5-      5.      