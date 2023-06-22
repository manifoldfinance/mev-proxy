import ape
from ape import project, accounts, Contract
from ape.cli import NetworkBoundCommand, network_option
import click

@click.group()
def cli():
    """
    Script to deploy and work with mev-eth proxy contract
    """

MULTISIG_ADDRESS = "0x0000000000000000000000000000000000000000"
IMPLEMENTATION_ADDRESS = "0x0000000000000000000000000000000000000000"

@cli.command(
    cls=NetworkBoundCommand,
)
@network_option()
def deploy(network):

    # Setup accounts for local and test networks
    if ':local' in network:
        account = accounts.test_accounts[0]
    else:
        account = accounts.load('alfa')
        account.set_autosign(True)

    kw = {
        'max_fee': project.provider.base_fee * 2,
        'max_priority_fee': int(0.5e9),
        'chain_id': project.provider.chain_id,
        'gas_price': project.provider.gas_price,
    }

    proxy = account.deploy(project.TransparentUpgradeableProxy, IMPLEMENTATION_ADDRESS, MULTISIG_ADDRESS, "", network=network, **kw)
    print(f"Deployed proxy contract at {proxy.address}")