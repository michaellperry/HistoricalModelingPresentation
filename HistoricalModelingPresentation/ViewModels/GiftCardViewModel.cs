using ThoughtCloud_Presentation.ViewModels;
using UpdateControls.Fields;

namespace HistoricalModelingPresentation.ViewModels
{
    public class GiftCardViewModel : IPresentationViewModel
    {
        public enum StateId
        {
            Start,
            Restaurants,
            InternetDown,
            LocalStorage,
            OutgoingQueue,
            OutgoingTransaction,
            InternetUp,
            IncomingQueue,
            IncomingTransaction,
            ConfirmFail,
            Retry,
            QueueSeed,
            AddValue,
            SendSeed,
            SendAddValue,
            End
        }

        private Independent<StateId> _state = new Independent<StateId>();

        public StateId State
        {
            get { return _state; }
        }

        public bool Forward()
        {
            if (_state.Value != StateId.End - 1)
            {
                _state.Value = _state.Value + 1;
                return true;
            }
            else
                return false;
        }

        public bool Backward()
        {
            if (_state.Value != StateId.Start)
            {
                _state.Value = _state.Value - 1;
                return true;
            }
            else
                return false;
        }

        public string LocalCardBalance456
        {
            get
            {
                if (_state.Value >= StateId.OutgoingTransaction)
                    return "$25.00";
                return "$40.00";
            }
        }

        public string ServerCardBalance456
        {
            get
            {
                if (_state.Value >= StateId.InternetUp)
                    return "$25.00";
                return "$40.00";
            }
        }

        public string LocalCardBalance123
        {
            get
            {
                if (_state.Value >= StateId.SendSeed)
                    return "$6.58";
                if (_state.Value >= StateId.AddValue)
                    return "$13.16";
                if (_state.Value >= StateId.Retry)
                    return "-$6.84";
                if (_state.Value >= StateId.IncomingTransaction)
                    return "$6.58";
                return "$20.00";
            }
        }

        public string ServerCardBalance123
        {
            get
            {
                if (_state.Value >= StateId.SendAddValue)
                    return "$26.58";
                if (_state.Value >= StateId.IncomingQueue)
                    return "$6.58";
                return "$20.00";
            }
        }

        public string LocalTransactionBody
        {
            get
            {
                if (_state.Value >= StateId.AddValue)
                    return "123\n+$20.00";
                return "456\n-$15.00";
            }
        }

        public string ServerTransactionBody
        {
            get
            {
                if (_state.Value >= StateId.QueueSeed)
                    return "123\n=$6.58";
                return "123\n-$13.42";
            }
        }
    }
}
