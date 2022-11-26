import 'package:bloc/bloc.dart';
import 'package:lista_cliente_com_bloc/blocs/client_events.dart';
import 'package:lista_cliente_com_bloc/repositories/clients_repository.dart';

import 'client_state.dart';

class ClientBloc extends Bloc<ClientEvent, ClientState> {
  final _clientRepo = ClientsRepository();

  ClientBloc() : super(ClientInitialState()) {
    on<LoadClientEvent>(
      (event, emit) => emit(
        ClientSuccessState(
          clients: _clientRepo.loadClients(),
        ),
      ),
    );

    on<AddClientEvent>(
      (event, emit) => emit(
        ClientSuccessState(
          clients: _clientRepo.addClient(event.client),
        ),
      ),
    );

    on<RemoveClientEvent>(
      (event, emit) => emit(
        ClientSuccessState(
          clients: _clientRepo.removeClient(event.client),
        ),
      ),
    );
  }
}
