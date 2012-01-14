using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ThoughtCloud_Presentation.ViewModels
{
    public class TextViewModel : IPresentationViewModel
    {
        private string _mainTitle;
        private string _subTitle;

        public TextViewModel(string mainTitle, string subTitle)
        {
            _mainTitle = mainTitle;
            _subTitle = subTitle;
        }

        public string MainTitle
        {
            get { return _mainTitle; }
        }

        public string SubTitle
        {
            get { return _subTitle; }
        }

        public bool Backward()
        {
            return false;
        }

        public bool Forward()
        {
            return false;
        }
    }
}
