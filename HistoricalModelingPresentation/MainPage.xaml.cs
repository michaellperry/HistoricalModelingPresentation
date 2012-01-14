using System.Windows.Controls;
using System.Windows.Input;
using ThoughtCloud.Presentation.Navigation;

namespace ThoughtCloud_Presentation
{
	public partial class MainPage : UserControl
	{
        private NavigationGraph _navigationGraph;

		public MainPage()
		{
			// Required to initialize variables
			InitializeComponent();
		}

        public NavigationGraph NavigationGraph
        {
            get { return _navigationGraph; }
            set { _navigationGraph = value; }
        }

        private void UserControl_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.PageDown)
            {
                _navigationGraph.Forward();
            }
            else if (e.Key == Key.PageUp)
            {
                _navigationGraph.Backward();
            }
        }
	}
}