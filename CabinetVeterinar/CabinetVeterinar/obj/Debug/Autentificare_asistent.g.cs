﻿#pragma checksum "..\..\Autentificare_asistent.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "0DEA27DDA317861483C3CB97BB3CA81C3F3809AF47C6CF2EC9743694DCA9A385"
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using CabinetVeterinar;
using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace CabinetVeterinar {
    
    
    /// <summary>
    /// Autentificare_asistent
    /// </summary>
    public partial class Autentificare_asistent : System.Windows.Window, System.Windows.Markup.IComponentConnector {
        
        
        #line 17 "..\..\Autentificare_asistent.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Image BtnImagine;
        
        #line default
        #line hidden
        
        
        #line 18 "..\..\Autentificare_asistent.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Label LblUserName;
        
        #line default
        #line hidden
        
        
        #line 19 "..\..\Autentificare_asistent.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button BtnListaProgramari;
        
        #line default
        #line hidden
        
        
        #line 20 "..\..\Autentificare_asistent.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button BtnListaProbeColectate;
        
        #line default
        #line hidden
        
        
        #line 21 "..\..\Autentificare_asistent.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.DataGrid gridListaProgramari;
        
        #line default
        #line hidden
        
        
        #line 37 "..\..\Autentificare_asistent.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button BtnDeconectare;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/CabinetVeterinar;component/autentificare_asistent.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\Autentificare_asistent.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            
            #line 9 "..\..\Autentificare_asistent.xaml"
            ((CabinetVeterinar.Autentificare_asistent)(target)).MouseDown += new System.Windows.Input.MouseButtonEventHandler(this.Window_MouseDown);
            
            #line default
            #line hidden
            return;
            case 2:
            this.BtnImagine = ((System.Windows.Controls.Image)(target));
            return;
            case 3:
            this.LblUserName = ((System.Windows.Controls.Label)(target));
            return;
            case 4:
            this.BtnListaProgramari = ((System.Windows.Controls.Button)(target));
            return;
            case 5:
            this.BtnListaProbeColectate = ((System.Windows.Controls.Button)(target));
            return;
            case 6:
            this.gridListaProgramari = ((System.Windows.Controls.DataGrid)(target));
            return;
            case 7:
            this.BtnDeconectare = ((System.Windows.Controls.Button)(target));
            
            #line 37 "..\..\Autentificare_asistent.xaml"
            this.BtnDeconectare.Click += new System.Windows.RoutedEventHandler(this.BtnListaAnimale_Click);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}

