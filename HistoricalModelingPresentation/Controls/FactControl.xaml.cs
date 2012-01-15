using System;
using System.Windows;
using System.Windows.Controls;

namespace HistoricalModelingPresentation.Controls
{
    public partial class FactControl : UserControl
    {
        public static readonly DependencyProperty TextProperty = DependencyProperty.Register(
            "Text",
            typeof(string),
            typeof(FactControl),
            new PropertyMetadata(String.Empty, TextChanged));

        public FactControl()
        {
            InitializeComponent();
        }

        public string Text
        {
            get { return (string)GetValue(TextProperty); }
            set { SetValue(TextProperty, value); }
        }

        private static void TextChanged(DependencyObject control, DependencyPropertyChangedEventArgs args)
        {
            ((FactControl)control).TextControl.Text = (string)args.NewValue;
        }
    }
}
